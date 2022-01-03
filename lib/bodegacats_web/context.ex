defmodule BodegacatsWeb.Context do
  @behaviour Plug

  import Plug.Conn

  alias Bodegacats.Token
  alias Bodegacats.Accounts

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  @spec build_context(Plug.Conn.t()) :: %{current_user: any} | %{error: any}
  def build_context(conn) do
    signer = create_signer()

    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- Token.verify_and_validate(token, signer),
         {:ok, current_user} <- Accounts.find_or_create(claims) do
      %{current_user: current_user}
    else
      _error -> %{}
    end
  end

  defp create_signer do
    jwks_url = "https://#{System.get_env("AUTH0_APP_DOMAIN")}/.well-known/jwks.json"

    with {:ok, 200, _headers, ref} <- :hackney.get(jwks_url),
         {:ok, raw_body} <- :hackney.body(ref),
         {:ok, jwks} <- Jason.decode(raw_body) do
      [rsa_key | _] = jwks["keys"]

      Joken.Signer.create("RS256", rsa_key)
    else
      error -> error
    end
  end
end
