defmodule Klaviyo.Metric do
  alias Klaviyo.RequestOperation

  @spec aggregates(Enum.t()) :: RequestOperation.t()
  def aggregates(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/metric-aggregates"
    }
  end

  @spec all(Enum.t()) :: RequestOperation.t()
  def all(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/metrics",
      query: params
    }
  end

  @spec get(String.t(), Enum.t()) :: RequestOperation.t()
  def get(metric_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/metrics/#{metric_id}",
      query: params
    }
  end
end
