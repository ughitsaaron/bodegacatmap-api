defmodule Bodegacats.Repo.Migrations.AddImages do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:images) do
      add :original_path, :string
      add :created_by, references(:users)

      timestamps()
    end

    alter table(:cats) do
      add :image_id, references(:images)
    end
  end
end
