defmodule BodegacatsWeb.Context do
  @behaviour Plug

  alias BodegacatsWeb.Auth

  def init(opts), do: opts

  def call(conn, _) do
    case Auth.is_authenticated?(conn) do
      {:ok, claims} -> Absinthe.Plug.put_options(conn, context: build_context(claims))
      _ -> Absinthe.Plug.put_options(conn, context: %{error: "not authenticated"})
    end
  end

  defp build_context(claims), do: %{current_user: Auth.get_current_user(claims)}
end
