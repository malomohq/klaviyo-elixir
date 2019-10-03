defmodule Klaviyo.Request do
  alias Klaviyo.{ Config, Helpers, Operation, Response }

  @spec send(Operation.t(), Config.t(), map) :: Klaviyo.response_t()
  def send(operation, config, private \\ %{})

  def send(operation, %{ retry: false } = config, private) do
    do_send(operation, config, private)
  end

  def send(operation, config, private) do
    private = Map.put_new(private, :attempts, 0)

    attempt = Map.get(private, :attempts) + 1
    max_attempts = Keyword.get(config.retry_opts, :max_attempts, 3)

    private = %{ private | attempts: attempt }

    result = do_send(operation, config, private)

    if retryable?(result) && max_attempts > attempt do
      send(operation, config, private)
    else
      result
    end
  end

  #
  # private
  #

  defp do_send(operation, config, private) do
    operation = Helpers.Operation.put_auth(operation, config)

    http_client_opts = config.http_client_opts

    body = Helpers.JSON.encode(operation.params, config)
    method = operation.method
    url = Helpers.URL.to_string(operation, config)

    result =
      config.http_client.request(
        method,
        url,
        [{ "content-type", "application/json" }],
        body,
        http_client_opts
      )

    case result do
      { :ok, %{ status_code: status_code } = response}
        when status_code >= 400 ->
        { :error, Response.new(response, private, config) }
      { :ok, %{ status_code: status_code } = response}
        when status_code >= 200 ->
        { :ok, Response.new(response, private, config) }
      otherwise ->
        otherwise
    end
  end

  defp retryable?(result) do
    case result do
      { :ok, _response } ->
        false
      { :error, %Response{ status_code: status_code } } when status_code >= 500 ->
        true
      { :error, %Response{} } ->
        false
      _otherwise ->
        true
    end
  end
end
