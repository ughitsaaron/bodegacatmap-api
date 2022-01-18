defmodule Bodegacats.Repo.Migrations.AlterImageRelations do
  use Ecto.Migration

  def change do
    alter table(:images) do
      add_if_not_exists(:cat_id, references(:cats))
    end

    alter table(:cats) do
      remove_if_exists(:image_id, references(:images))
    end
  end
end
