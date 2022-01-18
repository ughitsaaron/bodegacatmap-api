defmodule Bodegacats.Schema.Image.Resolvers do
  alias Bodegacats.Images

  def images(parent, _args, _context), do: {:ok, Images.list_images(parent)}

  def create_image(_parent, args, %{context: %{current_user: user}}) do
    Images.create_image(%{
      created_by: user.id,
      cat_id: args.cat_id,
      original_path: args.path
    })
  end

  def create_image(_parent, _args, _context), do: {:error, "Unauthorized"}
end
