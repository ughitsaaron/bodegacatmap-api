defmodule Bodegacats.Schema.Resolvers do
  # import Ecto.Query

  alias Bodegacats.Repo
  # alias Bodegacats.Cats
  # alias Bodegacats.Accounts

  alias Bodegacats.Cats.Cat
  # alias Bodegacats.Accounts.User

  def list_cats(_parent, _args, %{context: %{current_user: _current_user}}) do
    {:ok, Repo.all(Cat)}
  end

  def list_cats(_parent, _args, _), do: {:error, message: "Unauthorized", code: 401}

  def get_creator(parent, _args, _context) do
    creator = parent |> Ecto.assoc(:user) |> Repo.one()
    {:ok, creator}
  end

  # def get_cat(_parent, %{id: id}, _resolution) do
  #   case Repo.get(Cat, id) do
  #     nil ->
  #       {:error, "Cat #{id} not found"}

  #     cat ->
  #       {:ok, cat}
  #   end
  # end

  # def create_cat(_parent, args, _context) do
  #   Cats.create_cat(args)
  # end

  # def delete_cat(_parent, %{id: id, key: key}, _context) do
  #   query = from c in Cat, where: c.id == ^id
  #   admin_key = Application.get_env(:bodegacats, :admin_key)

  #   case Repo.one(query) do
  #     nil ->
  #       {:error, "Cat #{id} not found"}

  #     cat when key == admin_key ->
  #       Cats.delete_cat(cat)
  #   end
  # end
end
