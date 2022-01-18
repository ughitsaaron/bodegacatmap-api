defmodule BodegacatsWeb.Router do
  use BodegacatsWeb, :router
  use Plug.ErrorHandler

  alias Bodegacats.UploadController

  pipeline :graphql do
    plug BodegacatsWeb.Context
  end

  pipeline :protected do
    plug BodegacatsWeb.Protected
  end

  scope "/" do
    pipe_through :graphql

    forward "/graphql", Absinthe.Plug, schema: Bodegacats.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: Bodegacats.Schema,
      interface: :playground
  end

  scope "/upload" do
    pipe_through :protected

    post "/", UploadController, :upload_image
  end
end
