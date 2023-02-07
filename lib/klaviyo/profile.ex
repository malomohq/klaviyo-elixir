defmodule Klaviyo.Profile do
  alias Klaviyo.RequestOperation

  @spec all(Enum.t()) :: RequestOperation.t()
  def all(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/profiles",
      query: params
    }
  end

  @spec all_lists(String.t(), Enum.t()) :: RequestOperation.t()
  def all_lists(profile_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/profiles/#{profile_id}/lists",
      query: params
    }
  end

  @spec all_relationships(String.t(), String.t()) :: RequestOperation.t()
  def all_relationships(profile_id, related_resource) do
    %RequestOperation{
      method: :get,
      path: "/api/profiles/#{profile_id}/relationships/#{related_resource}"
    }
  end

  @spec all_segments(String.t(), Enum.t()) :: RequestOperation.t()
  def all_segments(profile_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/profiles/#{profile_id}/segments",
      query: params
    }
  end

  @spec create(Enum.t()) :: RequestOperation.t()
  def create(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/profiles"
    }
  end

  @spec get(String.t(), Enum.t()) :: RequestOperation.t()
  def get(profile_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/profiles/#{profile_id}",
      query: params
    }
  end

  @spec subscribe(Enum.t()) :: RequestOperation.t()
  def subscribe(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/profile-subscription-bulk-create-jobs"
    }
  end

  @spec suppress(Enum.t()) :: RequestOperation.t()
  def suppress(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/profile-suppression-bulk-create-jobs"
    }
  end

  @spec unsubscribe(Enum.t()) :: RequestOperation.t()
  def unsubscribe(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/profile-unsubscription-bulk-create-jobs"
    }
  end

  @spec unsuppress(Enum.t()) :: RequestOperation.t()
  def unsuppress(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/api/profile-unsuppression-bulk-create-jobs"
    }
  end

  @spec update(String.t(), Enum.t()) :: RequestOperation.t()
  def update(profile_id, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/profiles/#{profile_id}"
    }
  end
end
