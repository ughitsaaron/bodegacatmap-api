defmodule Bodegacats.Schema.Types do
  use Absinthe.Schema.Notation
  alias Bodegacats.Schema.Resolvers

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
  end

  object :cat do
    field :id, :id
    field :lat, :float
    field :lng, :float

    field :creator, :user do
      resolve(&Resolvers.get_creator/3)
    end

    field :inserted_at, :string
  end
end
