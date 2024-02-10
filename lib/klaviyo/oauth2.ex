defmodule Klaviyo.OAuth2 do
  alias Klaviyo.RequestOperation

  @spec authorize_url(String.t(), Enum.t()) :: String.t()
  def authorize_url(url \\ "https://www.klaviyo.com/oauth/authorize", params) do
    params =
      params
      |> put_in([:response_type], "code")
      |> put_in([:code_challenge_method], "S256")

    url
    |> URI.parse()
    |> Map.put(:query, URI.encode_query(params))
    |> URI.to_string()
  end

  @spec code_challenge(String.t()) :: String.t()
  def code_challenge(code_verifier) do
    digest = :crypto.hash(:sha256, code_verifier)

    Base.encode64(digest, padding: false)
  end

  @spec code_verifier(pos_integer) :: String.t()
  def code_verifier(length \\ 128) do
    symbols = Enum.concat([?0..?9, ?a..?z, ?A..?Z, ["_", ".", "-", "~"]])

    Stream.repeatedly(fn -> Enum.random(symbols) end)
    |> Enum.take(length)
    |> List.to_string()
  end

  @spec get_token(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def get_token(client_id, client_secret, params) do
    basic = Base.encode64("#{client_id}:#{client_secret}")

    %RequestOperation{
      body: params,
      encoding: :www_form,
      headers: [{"authorization", "Basic #{basic}"}],
      method: :post,
      path: "/oauth/token"
    }
  end
end
