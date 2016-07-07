defmodule UploadTest.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :category_id, references(:categories)

      timestamps()
    end

    create index(:items, [:category_id])
  end
end
