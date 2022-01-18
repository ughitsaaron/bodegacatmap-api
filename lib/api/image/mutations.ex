defmodule Bodegacats.Schema.Image.Mutations do
  use Absinthe.Schema.Notation

  alias Bodegacats.Schema.Image.Resolvers

  object :image_mutations do
    field :create_image, :image do
      arg(:cat_id, non_null(:id))
      arg(:path, non_null(:string))

      resolve(&Resolvers.create_image/3)
    end
  end
end
