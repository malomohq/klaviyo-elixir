defmodule Klaviyo.DataPrivacy do
  alias Klaviyo.RequestOperation

  @spec request_profile_deletion(Enum.t()) :: RequestOperation.t()
  def request_profile_deletion(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/data-privacy-deletion-jobs"
    }
  end
end
