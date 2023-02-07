defmodule Klaviyo.Client do
  alias Klaviyo.RequestOperation

  @spec create_event(String.t(), Enum.t()) :: RequestOperation.t()
  def create_event(company_id, params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/client/events",
      query: %{company_id: company_id}
    }
  end

  @spec create_or_update_profile(String.t(), Enum.t()) :: RequestOperation.t()
  def create_or_update_profile(company_id, params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/client/profiles",
      query: %{company_id: company_id}
    }
  end

  @spec create_subscription(String.t(), Enum.t()) :: RequestOperation.t()
  def create_subscription(company_id, params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/client/subscriptions",
      query: %{company_id: company_id}
    }
  end
end
