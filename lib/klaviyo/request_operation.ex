defmodule Klaviyo.RequestOperation do
  @moduledoc """
  Intermediate HTTP request data structure.

  Stores request details as their original data structures. This differs from
  `Klaviyo.Request` which stores request details in formats
  expected by an endpoint.
  """

  alias Klaviyo.HTTP

  @type t ::
          %__MODULE__{
            body: Enum.t(),
            encoding: :json | :www_form,
            headers: HTTP.headers_t(),
            method: HTTP.method_t(),
            query: Enum.t(),
            path: String.t()
          }

  defstruct body: [], encoding: :json, headers: [], method: nil, query: [], path: nil

  @doc """
  Builds a URL string.
  """
  @spec to_url(any, any) :: String.t()
  def to_url(operation, opts) do
    %URI{}
    |> Map.put(:scheme, opts.protocol)
    |> Map.put(:host, opts.host)
    |> Map.put(:port, opts.port)
    |> Map.put(:path, opts.path <> operation.path)
    |> Map.put(:query, URI.encode_query(operation.query))
    |> URI.to_string()
  end
end
