defmodule Bodegacats.Repo.Migrations.CatRefUser do
  use Ecto.Migration

  def change do
    alter table(:cats) do
      add :created_by, references(:users)
    end
  end
end
