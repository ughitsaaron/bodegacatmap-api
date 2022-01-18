defmodule Bodegacats.Schema.User.Resolvers do
  alias Bodegacats.Repo
  def creator(parent, _args, _context), do: {:ok, Ecto.assoc(parent, :user) |> Repo.one()}
end
