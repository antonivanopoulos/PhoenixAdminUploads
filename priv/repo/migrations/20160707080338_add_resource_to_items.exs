defmodule UploadTest.Repo.Migrations.AddResourceToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :resource, :string
    end
  end
end
