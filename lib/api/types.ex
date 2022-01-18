defmodule Bodegacats.Schema.Types do
  use Absinthe.Schema.Notation

  import_types(Bodegacats.Schema.Cat.Types)
  import_types(Bodegacats.Schema.User.Types)
  import_types(Bodegacats.Schema.Image.Types)
end
