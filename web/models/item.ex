defmodule UploadTest.Item do
  use UploadTest.Web, :model

  schema "items" do
    field :name, :string

    belongs_to :category, UploadTest.Category

    timestamps()
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:category, required: true)
  end
end