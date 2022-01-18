defmodule Bodegacats.Schema.Cat.Resolvers do
  alias Bodegacats.Cats
  alias Bodegacats.Images

  def cats(_parent, _args, _context) do
    {:ok, Cats.list_cats()}
  end

  def cat(_parent, %{id: id}, _context) do
    {:ok, Cats.get_cat!(id)}
  end

  def create_cat(
        _parent,
        %{img_path: img_path} = args,
        %{context: %{current_user: user}} = context
      ) do
    input = Map.take(args, [:lat, :lng])
    {:ok, cat} = create_cat(nil, input, context)

    {:ok, _image} =
      Images.create_image(%{
        created_by: user.id,
        cat_id: cat.id,
        original_path: img_path
      })

    {:ok, cat}
  end

  def create_cat(_parent, args, %{context: %{current_user: user}}) do
    Map.merge(args, %{created_by: user.id}) |> Cats.create_cat()
  end

  def create_cat(_parent, _args, _context), do: {:error, "Unauthorized"}
end
