defmodule UploadTest.Item do
  use UploadTest.Web, :model
  use Arc.Ecto.Schema

  schema "items" do
    field :name, :string
    field :resource, UploadTest.Resource.Type
    field :vector, UploadTest.Vector.Type

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
end
