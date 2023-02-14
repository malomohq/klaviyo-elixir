defmodule Klaviyo.Tag do
  alias Klaviyo.RequestOperation

  @spec all(Enum.t()) :: RequestOperation.t()
  def all(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/tags",
      query: params
    }
  end

  @spec all_for_group(String.t(), Enum.t()) :: RequestOperation.t()
  def all_for_group(tag_group_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/tag-groups/#{tag_group_id}/tags",
      query: params
    }
  end

  @spec all_groups(Enum.t()) :: RequestOperation.t()
  def all_groups(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/tag-groups",
      query: params
    }
  end

  @spec all_group_relationships(String.t(), String.t()) :: RequestOperation.t()
  def all_group_relationships(tag_group_id, related_resource) do
    %RequestOperation{
      method: :get,
      path: "/api/tag-groups/#{tag_group_id}/relationships/#{related_resource}"
    }
  end

  @spec all_relationships(String.t(), String.t()) :: RequestOperation.t()
  def all_relationships(tag_id, related_resource) do
    %RequestOperation{
      method: :get,
      path: "/api/tags/#{tag_id}/relationships/#{related_resource}"
    }
  end

  @spec create(Enum.t()) :: RequestOperation.t()
  def create(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/tags"
    }
  end

  @spec create_group(Enum.t()) :: RequestOperation.t()
  def create_group(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/tag-groups"
    }
  end

  @spec create_relationship(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def create_relationship(tag_id, related_resource, params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/tags/#{tag_id}/relationships/#{related_resource}"
    }
  end

  @spec delete(String.t()) :: RequestOperation.t()
  def delete(tag_id) do
    %RequestOperation{
      method: :delete,
      path: "/api/tags/#{tag_id}"
    }
  end

  @spec delete_group(String.t()) :: RequestOperation.t()
  def delete_group(tag_group_id) do
    %RequestOperation{
      method: :delete,
      path: "/api/tag-groups/#{tag_group_id}"
    }
  end

  @spec delete_relationship(String.t(), String.t()) :: RequestOperation.t()
  def delete_relationship(tag_id, related_resource) do
    %RequestOperation{
      method: :delete,
      path: "/api/tags/#{tag_id}/relationships/#{related_resource}"
    }
  end

  @spec get(String.t(), Enum.t()) :: RequestOperation.t()
  def get(tag_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/tags/#{tag_id}",
      query: params
    }
  end

  @spec get_group(String.t(), Enum.t()) :: RequestOperation.t()
  def get_group(tag_group_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/tag-groups/#{tag_group_id}",
      query: params
    }
  end

  @spec get_group_for_tag(String.t(), Enum.t()) :: RequestOperation.t()
  def get_group_for_tag(tag_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/tags/#{tag_id}/tag-group",
      query: params
    }
  end

  @spec update(String.t(), Enum.t()) :: RequestOperation.t()
  def update(tag_id, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/tags/#{tag_id}"
    }
  end

  @spec update_group(String.t(), Enum.t()) :: RequestOperation.t()
  def update_group(tag_group_id, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/tag-groups/#{tag_group_id}"
    }
  end
end
