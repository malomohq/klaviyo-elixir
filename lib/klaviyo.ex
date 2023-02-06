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
        ) :: Response.t()
  def send(operation, opts) do
    opts = Opts.new(opts)

    request = Request.new(operation, opts)

    case opts.client.send(request, opts) do
      {:ok, %HTTP.Response{status_code: status_code} = response}
      when status_code >= 400 ->
        {:error, Response.new(response, opts)}

      {:ok, %HTTP.Response{status_code: status_code} = response}
      when status_code >= 200 ->
        {:ok, Response.new(response, opts)}

      otherwise ->
        otherwise
    end
  end
end
