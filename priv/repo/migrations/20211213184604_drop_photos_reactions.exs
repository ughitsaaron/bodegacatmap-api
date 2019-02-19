defmodule Bodegacats.Repo.Migrations.DropPhotosReactions do
  use Ecto.Migration

  def change do
    drop table(:photos)
    drop table(:reactions)
  end
end
