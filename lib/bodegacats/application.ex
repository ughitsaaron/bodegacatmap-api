defmodule Bodegacats.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Bodegacats.Repo,
      # Start the endpoint when the application starts
      BodegacatsWeb.Endpoint
      # Starts a worker by calling: Bodegacats.Worker.start_link(arg)
      # {Bodegacats.Worker, arg},
    ]

    {Phoenix.PubSub, [name: Bodegacats.PubSub, adapter: Phoenix.PubSub.PG2]}

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bodegacats.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BodegacatsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
