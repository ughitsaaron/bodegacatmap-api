defmodule Bodegacats.Repo.Migrations.UserAddOpenidSub do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add_if_not_exists(:openid_sub, :string)
    end
  end
end
