defmodule BodegacatsWeb.Protected do
  @behaviour Plug

  import Plug.Conn
  alias BodegacatsWeb.Auth

  def init(_opts \\ []), do: :noop

  @spec call(Plug.Conn.t(), any) :: Plug.Conn.t()
  def call(conn, _) do
    case Auth.is_authenticated?(conn) do
      {:ok, claims} ->
        assign(conn, :current_user, Auth.get_current_user(claims))

      {:error, error_reason} ->
        send_resp(conn, 401, Jason.encode!(%{error: error_reason})) |> halt
    end
  end
end
