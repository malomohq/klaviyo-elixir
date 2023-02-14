defmodule Klaviyo do
  alias Klaviyo.HTTP
  alias Klaviyo.Opts
  alias Klaviyo.Request
  alias Klaviyo.RequestOperation
  alias Klaviyo.Response

  @type headers_t ::
          [{String.t(), String.t()}]

  @type method_t ::
          :delete | :get | :head | :patch | :post | :put

  @type response_t ::
          {:ok, Response.t()} | {:error, Response.t() | any}

  @type status_code_t ::
          pos_integer

  @doc """
  Send an HTTP request.
  """
  @spec send(
          RequestOperation.t(),
          keyword
        ) :: response_t
  def send(operation, opts) do
    opts = Opts.new(opts)

    request = Request.new(operation, opts)

    do_send(request, opts)
  end

  defp do_send(request, opts) do
    case opts.client.send(request, opts) do
      {:ok, %HTTP.Response{status_code: status_code} = response}
      when status_code >= 500 ->
        maybe_retry(Response.new(response, opts), request, opts)

      {:ok, %HTTP.Response{status_code: status_code} = response}
      when status_code >= 400 ->
        {:error, Response.new(response, opts)}

      {:ok, %HTTP.Response{status_code: status_code} = response}
      when status_code >= 200 ->
        {:ok, Response.new(response, opts)}

      result ->
        maybe_retry(result, request, opts)
    end
  end

  defp maybe_retry(result, request, opts) do
    if opts.retry do
      do_retry(result, request, opts)
    else
      {:error, result}
    end
  end

  defp do_retry(result, request, opts) do
    attempt = Map.get(request.private, :attempt, 1)

    max_attempts = Keyword.get(opts.retry_opts, :max_attempts, 3)

    if max_attempts >= attempt do
      seconds_to_wait = opts.retry.wait_for(request, opts)

      :timer.sleep(seconds_to_wait)

      request
      |> Map.put(:private, Map.put(request.private, :attempt, attempt + 1))
      |> do_send(opts)
    else
      {:error, result}
    end
  end
end
