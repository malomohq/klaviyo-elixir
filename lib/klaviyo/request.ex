defmodule Klaviyo.Request do
  @moduledoc """
  HTTP request sent to an endpoint.
  """

  alias Klaviyo.HTTP
  alias Klaviyo.Opts
  alias Klaviyo.RequestOperation

  @type t ::
          %__MODULE__{
            body: String.t(),
            headers: HTTP.headers_t(),
            method: HTTP.method_t(),
            private: map,
            url: String.t()
          }

  defstruct body: nil, headers: [], method: nil, private: %{}, url: nil

  @doc """
  Builds a `Klaviyo.HTTP.Request` struct.
  """
  @spec new(RequestOperation.t(), Opts.t()) :: t
  def new(operation, opts) do
    body = opts.json_codec.encode!(Enum.into(operation.body, %{}))
    headers = opts.headers
    method = operation.method
    url = RequestOperation.to_url(operation, opts)

    %__MODULE__{}
    |> Map.put(:body, body)
    |> Map.put(:headers, headers)
    |> Map.put(:method, method)
    |> Map.put(:url, url)
    |> put_header("authorization", "Klaviyo-API-Key #{opts.api_key}")
    |> put_header("content-type", "application/json")
    |> put_header("revision", opts.revision)
  end

  @doc """
  Adds a new request header if not present. Otherwise, replaces the previous
  value.
  """
  @spec put_header(t, String.t(), String.t()) :: t
  def put_header(request, key, value) do
    headers =
      request.headers
      |> Enum.into(%{})
      |> Map.put(key, value)
      |> Enum.into([])

    %{request | headers: headers}
  end
end
