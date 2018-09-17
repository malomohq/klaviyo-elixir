defmodule Klaviyo.Campaign do
  @doc """
  Cancel a campaign.
  """
  @spec cancel(String.t()) :: Klaviyo.Operation.t()
  def cancel(id) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      path: "v1/campaign/#{id}/cancel"
    }
  end

  @spec clone(String.t(), map) :: Klaviyo.Operation.t()
  def clone(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v1/campaign/#{id}/clone"
    }
  end

  @doc """
  Create a campaign.
  """
  @spec create(map) :: Klaviyo.Operation.t()
  def create(params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v1/campaigns"
    }
  end

  @doc """
  Get a list of all campaigns.
  """
  @spec list(map) :: Klaviyo.Operation.t()
  def list(params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/campaigns"
    }
  end

  @doc """
  Retrieve information about recipients for a campaign.
  """
  @spec recipients(String.t(), map) :: Klaviyo.Operation.t()
  def recipients(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/campaigns/#{id}/recipients"
    }
  end

  @doc """
  Retrieve information about a campaign.
  """
  @spec retrieve(String.t()) :: Klaviyo.Operation.t()
  def retrieve(id) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      path: "v1/campaign/#{id}"
    }
  end

  @doc """
  Schedule a campaign.
  """
  @spec schedule(String.t(), map) :: Klaviyo.Operation.t()
  def schedule(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v1/campaign/#{id}/schedule"
    }
  end

  @doc """
  Queues a campaign for immediate delivery.
  """
  @spec send(String.t()) :: Klaviyo.Operation.t()
  def send(id) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      path: "v1/campaign/#{id}/send"
    }
  end

  @doc """
  Update the details of a campaign.
  """
  @spec update(String.t(), map) :: Klaviyo.Operation.t()
  def update(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :put,
      params: params,
      path: "v1/campaign/#{id}"
    }
  end
end
