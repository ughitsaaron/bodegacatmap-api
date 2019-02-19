defmodule Bodegacats.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :sub, :string, source: :openid_sub

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :sub])
    |> validate_required([:name, :email, :sub])
    |> unique_constraint(:sub)
  end
end
