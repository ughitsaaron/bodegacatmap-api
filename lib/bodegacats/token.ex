defmodule Bodegacats.Token do
  use Joken.Config

  @impl true
  def token_config do
    default_claims(skip: [:aud, :iss])
    |> add_claim("aud", nil, &(&1 == System.get_env("AUTH0_APP_AUDIENCE")))
    |> add_claim("exp", nil, &(&1 > Joken.current_time()))
    |> add_claim("iat", nil, &(&1 <= Joken.current_time()))
    |> add_claim("iss", nil, &(&1 == System.get_env("AUTH0_APP_BASEURL")))
  end
end
