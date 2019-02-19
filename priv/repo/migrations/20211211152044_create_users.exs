defmodule Bodegacats.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    drop table(:user)

    create table(:users) do
      add :name, :string
      add :email, :string
      timestamps()
    end
  end
end
