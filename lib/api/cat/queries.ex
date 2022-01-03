defmodule Bodegacats.Schema.Cat.Queries do
  use Absinthe.Schema.Notation
  alias Bodegacats.Schema.Cat.Resolvers

  object :cat_queries do
    field :cats, list_of(:cat) do
      resolve(&Resolvers.cats/3)
    end
  end
end
