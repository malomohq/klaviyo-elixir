defmodule Klaviyo.Metric do
  @doc """
  List of all metrics.
  """
  @spec list(map) :: Klaviyo.Operation.t()
  def list(params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/metrics"
    }
  end

  @doc """
  Export event data.
  """
  @spec export(String.t(), map) :: Klaviyo.Operation.t()
  def export(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/metrics/#{id}/export"
    }
  end

  @doc """
  Batched timeline of all events.
  """
  @spec timeline_for_all_event_types(map) :: Klaviyo.Operation.t()
  def timeline_for_all_event_types(params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/metrics/timeline"
    }
  end

  @doc """
  Batched timeline of a single event type.
  """
  @spec timeline_for_event_type(String.t(), map) :: Klaviyo.Operation.t()
  def timeline_for_event_type(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/metrics/#{id}/timeline"
    }
  end
end
