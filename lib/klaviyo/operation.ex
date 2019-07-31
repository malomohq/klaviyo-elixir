defmodule Klaviyo.Operation do
  alias Klaviyo.{ Helpers }

  @type t ::
          %__MODULE__{
            auth: :private | :public,
            headers: Klaviyo.http_headers_t(),
            method: Klaviyo.http_method_t(),
            params: map,
            path: String.t()
          }

  defstruct auth: nil,
            headers: [],
            method: nil,
            params: %{},
            path: nil

  @spec perform(t, Klaviyo.Config.t()) ::
        { :ok, Klaviyo.Response.t() } | { :error, Klaviyo.Response.t() | any }
  def perform(operation, config) do
    operation = Helpers.Operation.put_auth(operation, config)

    body = Helpers.JSON.encode(operation.params, config)
    url = Helpers.URL.new(operation, config)

    result =
      config.http_client.request(
        operation.method,
        url,
        operation.headers,
        body,
        config.http_client_opts
      )

    case result do
      { :ok, %{ status_code: status_code } = response } when status_code < 400 ->
        { :ok, Klaviyo.Response.new(response, config) }
      { :ok, response } ->
        { :error, Klaviyo.Response.new(response, config) }
      { :error, _reason } ->
        result
    end
  end
end
