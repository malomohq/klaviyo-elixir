defmodule Klaviyo do
  @moduledoc """
  Elixir client for the Klaviyo REST API.
  """

  @type config_t :: [
          client: atom,
          client_opts: any,
          host: String.t(),
          json_codec: atom,
          path: String.t(),
          port: pos_integer,
          private_api_key: String.t(),
          protocol: String.t(),
          public_api_key: String.t()
        ]

  @doc """
  Send a request to the Klaviyo API.

  This functions takes an optional second parameter of configuration overrides.
  This is useful if you want to have different configuration per request.
  """
  @spec request(Klaviyo.Operation.t(), Keyword.t()) ::
          :success | :failure | {:ok, map} | {:error, map | String.t()}
  def request(operation, config_overrides \\ []) do
    config = Klaviyo.Config.new(config_overrides)

    Klaviyo.Operation.perform(operation, config)
  end

  @doc """
  Track properties of an individual without tracking an associated event.
  """
  @spec identify(map) :: Klaviyo.Operation.t()
  def identify(params) do
    %Klaviyo.Operation{
      auth: :public,
      base64_encode_query: true,
      http_method: :get,
      params: params,
      path: "identify"
    }
  end

  @doc """
  Track an event.
  """
  @spec track(map) :: Klaviyo.Operation.t()
  def track(params) do
    %Klaviyo.Operation{
      auth: :public,
      base64_encode_query: true,
      http_method: :get,
      params: params,
      path: "track"
    }
  end

  @doc """
  Track the first occurance of an event.
  """
  @spec track_once(map) :: Klaviyo.Operation.t()
  def track_once(params) do
    %Klaviyo.Operation{
      auth: :public,
      base64_encode_query: true,
      http_method: :get,
      params: params,
      path: "track-once"
    }
  end
end
