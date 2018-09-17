defmodule Klaviyo.Client do
  @moduledoc """
  Behaviour used to implement an HTTP client.

  Klaviyo allows you to use the HTTP client of your choice, provided that it can
  be coerced into complying with this module's specification.
  """

  @type http_method_t :: :get | :post | :put | :delete

  @callback request(
              method :: http_method_t,
              url :: String.t(),
              req_body :: binary,
              headers :: [{binary, binary}],
              client_opts :: term
            ) ::
              {:ok, %{status_code: pos_integer, body: binary}}
              | {:error, %{reason: String.t()}}
end
