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
    body = encode_body(operation.body, operation.encoding, opts)
    headers = opts.headers ++ operation.headers
    method = operation.method
    url = RequestOperation.to_url(operation, opts)

    %__MODULE__{}
    |> Map.put(:body, body)
    |> Map.put(:headers, headers)
    |> Map.put(:method, method)
    |> Map.put(:url, url)
    |> put_header("content-type", encoding(operation.encoding))
    |> put_header("revision", opts.revision)
    |> put_new_header("authorization", authentication_token(opts))
  end

  def authentication_token(%{access_token: access_token}) when not is_nil(access_token) do
    "Bearer #{access_token}"
  end

  def authentication_token(%{api_key: api_key}) when not is_nil(api_key) do
    "Klaviyo-API-Key #{api_key}"
  end

  def authentication_token(_) do
    nil
  end

  @spec encode_body(Enum.t(), atom, Opts.t()) :: String.t()
  def encode_body(body, :json, opts) do
    opts.json_codec.encode!(Enum.into(body, %{}))
  end

  def encode_body(body, :www_form, _opts) do
    URI.encode_query(body, :www_form)
  end

  @spec encoding(atom) :: String.t()
  def encoding(:json) do
    "application/json"
  end

  def encoding(:www_form) do
    "application/x-www-form-urlencoded"
  end

  @doc """
  Adds a new request header if not present. Otherwise, replaces the previous
  value.
  """
  @spec put_header(t, String.t(), String.t()) :: t
  def put_header(request, key, value) do
    header = {key, value}

    headers = request.headers ++ [header]

    %{request | headers: headers}
  end

  @spec put_new_header(t, String.t(), String.t()) :: t
  def put_new_header(request, key, value) do
    has_header = Enum.any?(request.headers, fn {name, _} -> name == key end)

    if has_header do
      request
    else
      put_header(request, key, value)
    end
  end
end
