defmodule Klaviyo.List do
  @doc """
  Add profiles to a list.
  """
  @spec add_profiles(String.t(), list) :: Klaviyo.Operation.t()
  def add_profiles(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v2/list/#{id}/members"
    }
  end

  @doc """
  Check if profiles are on a list.
  """
  @spec check_for_profile(String.t(), list) :: Klaviyo.Operation.t()
  def check_for_profile(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v2/list/#{id}/members"
    }
  end

  @doc """
  Check if profiles are on a list and not suppressed.
  """
  @spec check_subscription(String.t(), list) :: Klaviyo.Operation.t()
  def check_subscription(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v2/list/#{id}/subscribe"
    }
  end

  @doc """
  Create a list.
  """
  @spec create(map) :: Klaviyo.Operation.t()
  def create(params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v2/lists"
    }
  end

  @doc """
  Delete a list.
  """
  @spec delete(String.t()) :: Klaviyo.Operation.t()
  def delete(id) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :delete,
      path: "v2/list/#{id}"
    }
  end

  @doc """
  Get all emails that have been excluded from a list along with the exclusion
  reason and exclusion time.
  """
  @spec exclusions(String.t(), map) :: Klaviyo.Operation.t()
  def exclusions(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v2/list/#{id}/exclusions/all"
    }
  end

  @doc """
  Get all emails in a given list or segment.
  """
  @spec group_membership_emails(String.t(), map) :: Klaviyo.Operation.t()
  def group_membership_emails(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v2/group/#{id}/members/all"
    }
  end

  @doc """
  All lists for an account.
  """
  @spec list() :: Klaviyo.Operation.t()
  def list() do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      path: "v2/lists"
    }
  end

  @doc """
  Remove profiles from a list.
  """
  @spec remove_profiles(String.t(), list) :: Klaviyo.Operation.t()
  def remove_profiles(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :delete,
      params: params,
      path: "/v2/list/#{id}/members"
    }
  end

  @doc """
  Retrieve information for a list.
  """
  @spec retrieve(String.t()) :: Klaviyo.Operation.t()
  def retrieve(id) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      path: "v2/list/#{id}"
    }
  end

  @doc """
  Subscribe or re-subscribe profiles to a list.
  """
  @spec subscribe(String.t(), list) :: Klaviyo.Operation.t()
  def subscribe(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v2/list/#{id}/subscribe"
    }
  end

  @doc """
  Unsubscribe and remove profiles from a list.
  """
  @spec unsubscribe(String.t(), list) :: Klaviyo.Operation.t()
  def unsubscribe(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :delete,
      params: params,
      path: "v2/list/#{id}/subscribe"
    }
  end

  @doc """
  Update the properties of a list.
  """
  @spec update(String.t(), map) :: Klaviyo.Operation.t()
  def update(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :put,
      params: params,
      path: "v2/list/#{id}"
    }
  end
end
