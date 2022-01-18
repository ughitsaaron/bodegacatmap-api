defmodule Bodegacats.Schema.Cat.Types do
  use Absinthe.Schema.Notation

  alias Bodegacats.Schema.Cat.Queries, as: CatQueries
  alias Bodegacats.Schema.Cat.Mutations, as: CatMutations

  alias Bodegacats.Schema.Image.Resolvers, as: ImageResolvers
  alias Bodegacats.Schema.User.Resolvers, as: UserResolvers

  import_types(CatQueries)
  import_types(CatMutations)

  object :cat do
    field :id, :id
    field :lat, :float
    field :lng, :float
    field :inserted_at, :string

    field :images, list_of(:image) do
      resolve(&ImageResolvers.images/3)
    end

    field :creator, :user do
      resolve(&UserResolvers.creator/3)
    end
  end
end
