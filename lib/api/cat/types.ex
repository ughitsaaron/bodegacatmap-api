defmodule Bodegacats.Schema.Cat.Types do
  use Absinthe.Schema.Notation

  alias Bodegacats.Schema.Cat.Resolvers, as: CatResolvers
  alias Bodegacats.Schema.Cat.Queries, as: CatQueries

  import_types(CatQueries)

  object :cat do
    field :id, :id
    field :lat, :float
    field :lng, :float
    field :inserted_at, :string

    field :creator, :user do
      resolve(&CatResolvers.creator/3)
    end
  end
end
