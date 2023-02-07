defmodule Klaviyo.Event do
  alias Klaviyo.RequestOperation

  @spec all(Enum.t()) :: RequestOperation.t()
  def all(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/events",
      query: params
    }
  end

  @spec all_metrics(String.t(), Enum.t()) :: RequestOperation.t()
  def all_metrics(event_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/events/#{event_id}/metrics",
      query: params
    }
  end

  @spec all_profiles(String.t(), Enum.t()) :: RequestOperation.t()
  def all_profiles(event_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/events/#{event_id}/profiles",
      query: params
    }
  end

  @spec all_relationships(String.t(), String.t()) :: RequestOperation.t()
  def all_relationships(event_id, related_resource) do
    %RequestOperation{
      method: :get,
      path: "/api/events/#{event_id}/relationships/#{related_resource}"
    }
  end

  @spec create(Enum.t()) :: RequestOperation.t()
  def create(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/events"
    }
  end

  @spec get(String.t(), Enum.t()) :: RequestOperation.t()
  def get(event_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/events/#{event_id}",
      query: params
    }
  end
end
