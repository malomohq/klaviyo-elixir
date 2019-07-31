defmodule Klaviyo.Helpers.URL do
  alias Klaviyo.{ Helpers }

  def new(operation, config) do
    %URI{ path: config.path, port: config.port, scheme: config.protocol }
    |> Map.put(:path, config.path)
    |> Map.put(:port, config.port)
    |> Map.put(:scheme, config.protocol)
    |> put_query(operation, config)
    |> URI.to_string()
  end

  defp put_query(uri, %{ auth: :public, method: :get } = operation, config) do
    data =
      operation.params
      |> Helpers.JSON.encode(config)
      |> Base.encode64()

    Map.put(uri, :query, "data=#{data}")
  end

  defp put_query(uri, %{ method: :get } = operation, _config) do
    Map.put(uri, :query, URI.encode_query(operation.params))
  end

  defp put_query(uri, _operation, _config) do
    uri
  end
end
