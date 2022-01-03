defmodule Bodegacats.Schema.Cat.Resolvers do
  alias Bodegacats.Repo
  alias Bodegacats.Cats

  def cats(_parent, _args, _context) do
    {:ok, Cats.list_cats()}
  end

  def creator(parent, _args, _context) do
    creator = parent |> Ecto.assoc(:user) |> Repo.one()
    {:ok, creator}
  end
end
