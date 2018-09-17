defmodule Klaviyo.Operation do
  defstruct auth: nil,
            base64_encode_query: false,
            headers: [],
            http_method: nil,
            params: %{},
            path: nil

  @type t :: %__MODULE__{
          auth: :private | :public,
          base64_encode_query: boolean,
          headers: Keyword.t(),
          http_method: atom,
          params: map,
          path: String.t()
        }

  @spec perform(t, Klaviyo.Config.t()) ::
          :success | :failure | {:ok, map} | {:error, map | String.t()}
  def perform(operation, config) do
    operation
    |> put_auth(config)
    |> request(config)
    |> parse(config)
  end

  defp put_auth(operation, config) do
    params = operation.params

    api_key =
      case operation.auth do
        :private -> %{api_key: config.private_api_key}
        :public -> %{token: config.public_api_key}
      end

    params = Map.merge(params, api_key)

    Map.put(operation, :params, params)
  end

  defp request(operation, config) do
    client = config.client
    client_opts = config.client_opts

    http_method = operation.http_method
    url = build_url(operation, config)
    headers = operation.headers
    body = build_body(operation, config)

    client.request(http_method, url, headers, body, client_opts)
  end

  defp build_url(operation, config) do
    protocol = config.protocol
    host = config.host

    "#{protocol}://#{host}"
    |> put_port(config)
    |> put_path(config)
    |> put_path(operation)
    |> put_query(operation, config)
    |> URI.encode()
  end

  defp put_port(url, %{port: nil}) do
    url
  end

  defp put_port(url, %{port: port}) do
    "#{url}:#{port}"
  end

  defp put_path(url, %{path: nil}) do
    url
  end

  defp put_path(url, %{path: path}) do
    "#{url}/#{path}"
  end

  defp put_query(url, %{base64_encode_query: true, http_method: :get, params: params}, config)
       when params != %{} do
    data =
      params
      |> config.json_codec.encode!()
      |> Base.encode64()

    "#{url}?data=#{data}"
  end

  defp put_query(url, %{http_method: :get, params: params}, _config) when params != %{} do
    "#{url}?#{URI.encode_query(params)}"
  end

  defp put_query(url, _http_method, _params) do
    url
  end

  defp build_body(%{http_method: http_method, params: params}, %{json_codec: json_codec})
       when http_method != :get do
    json_codec.encode!(params)
  end

  defp build_body(_operation, _config) do
    ""
  end

  defp parse({:ok, %{body: body, status_code: status_code}}, %{json_codec: json_codec})
       when status_code >= 200 and status_code < 400 do
    case body do
      "" ->
        {:ok, %{}}

      "1" ->
        :success

      "0" ->
        :failure

      _otherwise ->
        {:ok, json_codec.decode!(body)}
    end
  end

  defp parse({:ok, %{body: body, status_code: status_code}}, %{json_codec: json_codec})
       when status_code >= 400 do
    case body do
      "" ->
        {:error, %{}}

      _otherwise ->
        {:ok, json_codec.decode!(body)}
    end
  end

  defp parse({:error, reason}, _config) do
    {:error, reason}
  end
end
