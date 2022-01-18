defmodule BodegacatsWeb.Auth do
  import Plug.Conn

  alias Bodegacats.Token
  alias Bodegacats.Accounts

  @spec get_current_user(nil | maybe_improper_list | map) :: any
  def get_current_user(claims) do
    {:ok, current_user} = Accounts.find_or_create(claims)

    current_user
  end

  def is_authenticated?(conn) do
    signer = create_signer()

    with ["Bearer " <> token] <- get_req_header(conn, "authorization") do
      Token.verify_and_validate(token, signer)
    else
      _error -> {:error, :unauthorized}
    end
  end

  defp create_signer do
    jwks_url = "https://#{System.get_env("AUTH0_APP_DOMAIN")}/.well-known/jwks.json"

    with {:ok, 200, _headers, ref} <- :hackney.get(jwks_url),
         {:ok, raw_body} <- :hackney.body(ref),
         {:ok, jwks} <- Jason.decode(raw_body),
         [rsa_key | _] <- jwks["keys"] do
      Joken.Signer.create("RS256", rsa_key)
    else
      error -> error
      _ -> %{error: :unknown}
    end
  end
end
