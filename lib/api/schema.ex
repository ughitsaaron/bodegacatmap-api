defmodule Bodegacats.Schema do
  alias Bodegacats.Schema.Resolvers

  use Absinthe.Schema
  import_types(Bodegacats.Schema.Types)
  import_types(Absinthe.Plug.Types)

  query do
    field :cats, list_of(:cat) do
      resolve(&Resolvers.list_cats/3)
    end

    # field :cat, :cat do
    #   arg(:id, non_null(:id))
    #   resolve(&Resolvers.get_cat/3)
    # end
  end

  # mutation do
  #   field :create_cat, type: :cat do
  #     arg(:lat, non_null(:float))
  #     arg(:lng, non_null(:float))
  #     resolve(&Resolvers.create_cat/3)
  #   end

  #   field :delete_cat, type: :cat do
  #     arg(:id, non_null(:id))
  #     arg(:key, non_null(:string))
  #     resolve(&Resolvers.delete_cat/3)
  #   end
  # end
end
