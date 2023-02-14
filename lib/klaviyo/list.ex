defmodule Klaviyo.List do
  alias Klaviyo.RequestOperation

  @spec add_profile(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def add_profile(list_id, related_resource, params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/lists/#{list_id}/relationships/#{related_resource}/"
    }
  end

  @spec all(Enum.t()) :: RequestOperation.t()
  def all(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/lists",
      query: params
    }
  end

  @spec all_tags(String.t(), Enum.t()) :: RequestOperation.t()
  def all_tags(list_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/lists/#{list_id}/tags",
      query: params
    }
  end

  @spec all_profiles(String.t(), Enum.t()) :: RequestOperation.t()
  def all_profiles(list_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/lists/#{list_id}/profiles",
      query: params
    }
  end

  @spec all_relationships(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def all_relationships(list_id, related_resource, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/lists/#{list_id}/relationships/#{related_resource}",
      query: params
    }
  end

  @spec create(Enum.t()) :: RequestOperation.t()
  def create(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/lists"
    }
  end

  @spec delete(String.t()) :: RequestOperation.t()
  def delete(list_id) do
    %RequestOperation{
      method: :delete,
      path: "/api/lists/#{list_id}"
    }
  end

  @spec get(String.t(), Enum.t()) :: RequestOperation.t()
  def get(list_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/lists/#{list_id}",
      query: params
    }
  end

  @spec remove_profile(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def remove_profile(list_id, related_resource, params) do
    %RequestOperation{
      body: params,
      method: :delete,
      path: "/api/lists/#{list_id}/relationships/#{related_resource}/"
    }
  end

  @spec update(String.t(), Enum.t()) :: RequestOperation.t()
  def update(list_id, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/lists/#{list_id}"
    }
  end
end
