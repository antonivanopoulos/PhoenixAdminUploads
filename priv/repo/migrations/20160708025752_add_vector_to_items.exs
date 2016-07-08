defmodule UploadTest.Repo.Migrations.AddVectorToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :vector, :string
    end
  end
end
