defmodule Klaviyo.List do
  @doc """
  Add people to a list without changing their subscription or suppression
  status.
  """
  @spec add_as_member(String.t(), map) :: Klaviyo.Operation.t()
  def add_as_member(list_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v2/list/#{list_id}/members"
    }
  end

  @doc """
  Add people to a list in addition to modifying their membership and updating
  their suppressions.

  People will be single or double opted into the specified list in accordance
  with that list's settings.
  """
  @spec add_as_subscriber(String.t(), map) :: Klaviyo.Operation.t()
  def add_as_subscriber(list_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v2/list/#{list_id}/subscribe"
    }
  end

  @doc """
  Returns an array of lists.
  """
  @spec all :: Klaviyo.Operation.t()
  def all do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: "v2/lists"
    }
  end

  @doc """
  Get all emails that have been excluded from a list along with the reason and
  time they were excluded.
  """
  @spec all_exclusions(String.t(), map) :: Klaviyo.Operation.t()
  def all_exclusions(list_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v2/list/#{list_id}/exclusions/all",
    }
  end

  @doc """
  Get all emails in a given list or segment.
  """
  @spec all_group_members(String.t(), map) :: Klaviyo.Operation.t()
  def all_group_members(list_id_or_segment_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v2/group/#{list_id_or_segment_id}/members/all"
    }
  end

  @doc """
  Create a new list.
  """
  @spec create(map) :: Klaviyo.Operation.t()
  def create(params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v2/lists"
    }
  end

  @doc """
  Delete a list.
  """
  @spec delete(String.t()) :: Klaviyo.Operation.t()
  def delete(list_id) do
    %Klaviyo.Operation{
      auth: :private,
      method: :delete,
      path: "v2/list/#{list_id}"
    }
  end

  @doc """
  Retrieve a list.
  """
  @spec get(String.t()) :: Klaviyo.Operation.t()
  def get(list_id) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: "v2/list/#{list_id}"
    }
  end

  @doc """
  Get people that are on a list.
  """
  @spec get_memberships(String.t(), map) :: Klaviyo.Operation.t()
  def get_memberships(list_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v2/list/#{list_id}/members"
    }
  end

  @doc """
  Get people that are on a list and not suppressed.
  """
  @spec get_subscriptions(String.t(), map) :: Klaviyo.Operation.t()
  def get_subscriptions(list_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v2/list/#{list_id}/subscribe"
    }
  end

  @doc """
  Remove members from a list
  """
  def remove_as_member(list_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :delete,
      params: params,
      path: "v2/list/#{list_id}/members"
    }
  end

  @doc """
  Remove subscribers from a list.
  """
  @spec remove_as_subscriber(String.t(), map) :: Klaviyo.Operation.t()
  def remove_as_subscriber(list_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :delete,
      params: params,
      path: "v2/list/#{list_id}/subscribe"
    }
  end

  @doc """
  Update a list.
  """
  @spec update(String.t(), map) :: Klaviyo.Operation.t()
  def update(list_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :put,
      params: params,
      path: "v2/list/#{list_id}"
    }
  end
end
