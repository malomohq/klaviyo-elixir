defmodule Klaviyo.Client do
  @moduledoc """
  Behaviour for implementing an HTTP client.
  """

  @callback request(
              method :: Klaviyo.http_method_t(),
              url :: String.t(),
              headers :: Klaviyo.http_headers_t(),
              body :: binary,
              opts :: any
            ) :: { :ok, Klaviyo.http_response_t() } | { :error, any }
end
