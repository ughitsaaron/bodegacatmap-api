defmodule Bodegacats.Schema.Image.Types do
  use Absinthe.Schema.Notation

  alias Bodegacats.Schema.Image.Mutations, as: ImageMutations
  alias Bodegacats.Schema.User.Resolvers, as: UserResolvers

  import_types(ImageMutations)

  object :image do
    field :id, :id
    field :path, non_null(:string), resolve: rename(:original_path)
    field :inserted_at, :string

    field :creator, :user do
      resolve(&UserResolvers.creator/3)
    end
  end

  defp rename(field) do
    fn root, _, _ -> {:ok, Map.get(root, field)} end
  end
end
