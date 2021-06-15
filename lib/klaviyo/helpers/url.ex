defmodule Klaviyo.Helpers.URL do
  alias Klaviyo.{ Helpers }

  def to_string(operation, config) do
    operation
    |> to_uri(config)
    |> URI.to_string()
  end

  def to_uri(operation, config) do
    %URI{}
    |> Map.put(:host, config.host)
    |> Map.put(:port, config.port)
    |> Map.put(:scheme, config.protocol)
    |> put_path(operation, config)
    |> put_query(operation, config)
  end

  #
  # private
  #

  defp put_path(uri, operation, config) do
    Map.put(uri, :path, "#{config.path}/#{operation.path}")
  end

  defp put_query(uri, %{ auth: :public, method: :get } = operation, config) do
    data =
      operation.params
      |> Helpers.JSON.encode(config)
      |> Base.url_encode64()

    Map.put(uri, :query, "data=#{data}")
  end

  defp put_query(uri, %{ method: :get } = operation, _config) do
    Map.put(uri, :query, URI.encode_query(operation.params))
  end

  defp put_query(uri, _operation, _config) do
    uri
  end
end
