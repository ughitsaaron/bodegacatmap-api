defmodule Bodegacats.Repo.Migrations.RemoveAll do
  use Ecto.Migration

  def change, do: nil

  def down do
    drop_if_exists table("photo")
    drop_if_exists table("reaction")
  end
end
