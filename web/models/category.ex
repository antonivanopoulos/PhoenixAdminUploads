defmodule UploadTest.Category do
  use UploadTest.Web, :model

  @derive {Poison.Encoder, only: [:name]}
  schema "categories" do
    field :name, :string

    has_many :items, UploadTest.Item

    timestamps()
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
