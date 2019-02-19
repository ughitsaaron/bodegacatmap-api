defmodule Bodegacats.Repo.Migrations.CreateCats do
  use Ecto.Migration

  def change do
    drop table(:cat)

    create_if_not_exists table(:cats) do
      add :lat, :float
      add :lng, :float

      timestamps()
    end
  end
end
