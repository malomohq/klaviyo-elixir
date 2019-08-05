defmodule Klaviyo.Campaign do
  @doc """
  Return all campaigns.

  Campaigns are returned in reverse sorted order by the time they were created.
  """
  @spec all(map) :: Klaviyo.Operation.t()
  def all(params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v1/campaigns"
    }
  end

  @doc """
  Return summary details for all email recipients of a campaign.
  """
  @spec all_recipients(String.t(), map) :: Klaviyo.Operation.t()
  def all_recipients(campaign_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v1/campaign/#{campaign_id}/recipients"
    }
  end

  @doc """
  Cancel a campaign that has been queued to send.

  Marks a campaign as cancelled regardless of it's current status.
  """
  @spec cancel(String.t()) :: Klaviyo.Operation.t()
  def cancel(campaign_id) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      path: "v1/campaign/#{campaign_id}/cancel"
    }
  end

  @doc """
  Creates a copy of a campaign.

  Campaigns are created as drafts.
  """
  @spec clone(String.t(), map) :: Klaviyo.Operation.t()
  def clone(campaign_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v1/campaign/#{campaign_id}/clone"
    }
  end

  @doc """
  Create a campaign.

  Campaigns are created as drafts.
  """
  @spec create(map) :: Klaviyo.Operation.t()
  def create(params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v1/campaigns"
    }
  end

  @doc """
  Retrieve a campaign summary.
  """
  @spec get(String.t()) :: Klaviyo.Operation.t()
  def get(campaign_id) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: "v1/campaign/#{campaign_id}"
    }
  end

  @doc """
  Schedule a campaign to be sent sometime in the future.
  """
  @spec schedule(String.t(), map) :: Klaviyo.Operation.t()
  def schedule(campaign_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v1/campaign/#{campaign_id}/schedule"
    }
  end

  @doc """
  Send a campaign immediately.
  """
  def send(campaign_id) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      path: "v1/campaign/#{campaign_id}/send"
    }
  end

  @doc """
  Update a campaign.
  """
  @spec update(String.t(), map) :: Klaviyo.Operation.t()
  def update(campaign_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :put,
      params: params,
      path: "v1/campaign/#{campaign_id}"
    }
  end
end
