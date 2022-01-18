defmodule Bodegacats.Schema.Cat.Mutations do
  use Absinthe.Schema.Notation

  alias Bodegacats.Schema.Cat.Resolvers

  object :cat_mutations do
    field :create_cat, :cat do
      arg(:lat, non_null(:float))
      arg(:lng, non_null(:float))
      arg(:img_path, :string)

      resolve(&Resolvers.create_cat/3)
    end
  end
end
