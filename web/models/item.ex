defmodule UploadTest.Item do
  use UploadTest.Web, :model
  use Arc.Ecto.Schema

  schema "items" do
    field :name, :string
    field :resource, UploadTest.Resource.Type
    field :vector, UploadTest.Vector.Type
    field :vector_path, :string, virtual: true

    belongs_to :category, UploadTest.Category

    timestamps()
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> cast_attachments(params, [:resource])
    |> cast_attachments(params, [:vector])
    |> cast_assoc(:category, required: true)
  end

  def vector_path(item) do
    %HTTPoison.Response{body: body} = HTTPoison.get!(UploadTest.Vector.url({item.vector, item}, :original, signed: true))
    body
  end

  def encode_item(item) do
    %UploadTest.Item{item | vector_path: UploadTest.Item.vector_path(item) }
  end

  defimpl Poison.Encoder, for: UploadTest.Item do
    def encode(item, options) do
      encoded_item = UploadTest.Item.encode_item(item)
      Poison.Encoder.Map.encode(Map.take(encoded_item, [:id, :name, :vector_path]), options)
    end
  end
end
