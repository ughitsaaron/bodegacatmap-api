defmodule BodegacatsWeb.Router do
  use BodegacatsWeb, :router

  pipeline :graphql do
    plug BodegacatsWeb.Context
  end

  scope "/" do
    pipe_through :graphql

    forward "/graphql", Absinthe.Plug, schema: Bodegacats.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: Bodegacats.Schema,
      interface: :playground
  end
end
