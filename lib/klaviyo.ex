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
  @spec request(Klaviyo.Operation.t(), config_t) ::
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

  @doc """
  List of all metrics.
  """
  @spec metrics_list(map) :: Klaviyo.Operation.t()
  def metrics_list(params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/metrics"
    }
  end

  @doc """
  Batched timeline of all events.
  """
  @spec metrics_timeline(map) :: Klaviyo.Operation.t()
  def metrics_timeline(params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/metrics/timeline"
    }
  end

  @doc """
  Batched timeline of a single metric type.
  """
  @spec metric_timeline(String.t(), map) :: Klaviyo.Operation.t()
  def metric_timeline(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/metrics/#{id}/timeline"
    }
  end

  @doc """
  Export event data.
  """
  @spec metric_export(String.t(), map) :: Klaviyo.Operation.t()
  def metric_export(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/metrics/#{id}/export"
    }
  end

  @doc """
  Add or update one or more attributes of a person.
  """
  @spec person_update(String.t(), map) :: Klaviyo.Operation.t()
  def person_update(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :put,
      params: params,
      path: "v1/person/#{id}"
    }
  end

  @doc """
  Batched timeline of all events for a person.
  """
  @spec person_metrics_timeline(String.t(), map) :: Klaviyo.Operation.t()
  def person_metrics_timeline(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/person/#{id}/metrics/timeline"
    }
  end

  @doc """
  Batched timeline of a single metric type for a person.
  """
  @spec person_metric_timeline(String.t(), String.t(), map) :: Klaviyo.Operation.t()
  def person_metric_timeline(person_id, metric_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/person/#{person_id}/metrics/#{metric_id}/timeline"
    }
  end
end
