defmodule Klaviyo.Metric do
  @doc """
  Returns a list of all metrics.
  """
  @spec all(map) :: Klaviyo.Operation.t()
  def all(params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v1/metrics"
    }
  end

  @doc """
  Export event data. Optionally filtering and segmented on available event
  properties.
  """
  @spec export(String.t(), map) :: Klaviyo.Operation.t()
  def export(metric_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v1/metric/#{metric_id}/export"
    }
  end

  @doc """
  Returns a batched timeline of all events.
  """
  @spec timeline(map) :: Klaviyo.Operation.t()
  def timeline(params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v1/metrics/timeline"
    }
  end

  @doc """
  Returns a batched timeline for one specific type of metric.
  """
  @spec timeline(String.t(), map) :: Klaviyo.Operation.t()
  def timeline(metric_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v1/metric/#{metric_id}/timeline"
    }
  end
end
