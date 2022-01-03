defmodule Bodegacats.Schema do
  use Absinthe.Schema

  import_types(Bodegacats.Schema.Types)
  import_types(Absinthe.Plug.Types)

  query do
    import_fields(:cat_queries)
  end
end
