defmodule Klaviyo.Client do
  @moduledoc """
  Behaviour for implementing an HTTP client.
  """

  @type response_t ::
          %{
            body: binary,
            headers: Klaviyo.http_headers_t(),
            status_code: pos_integer
          }

  @callback request(
              method :: Klaviyo.http_method_t(),
              url :: String.t(),
              headers :: Klaviyo.http_headers_t(),
              body :: binary,
              opts :: any
            ) :: { :ok, response_t() } | { :error, any }
end
