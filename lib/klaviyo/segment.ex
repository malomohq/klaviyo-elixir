defmodule Klaviyo.Segment do
  alias Klaviyo.RequestOperation

  @spec all(Enum.t()) :: RequestOperation.t()
  def all(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/segments",
      query: params
    }
  end

  @spec all_profiles(String.t(), Enum.t()) :: RequestOperation.t()
  def all_profiles(segment_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/segments/#{segment_id}/profiles",
      query: params
    }
  end

  @spec all_relationships(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def all_relationships(segment_id, related_resource, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/segments/#{segment_id}/relationships/#{related_resource}",
      query: params
    }
  end

  @spec all_tags(String.t(), Enum.t()) :: RequestOperation.t()
  def all_tags(segment_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/segments/#{segment_id}/tags",
      query: params
    }
  end

  @spec get(String.t(), Enum.t()) :: RequestOperation.t()
  def get(segment_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/segments/#{segment_id}",
      query: params
    }
  end

  @spec update(String.t(), Enum.t()) :: RequestOperation.t()
  def update(segment_id, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/segments/#{segment_id}"
    }
  end
end
