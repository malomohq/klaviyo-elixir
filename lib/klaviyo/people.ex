defmodule Klaviyo.People do
  @doc """
  Retrieve people.

  Requires any one of following as params:
  - `{email: email}`
  - `{external_id: external_id}`
  - `{phone: phone}`
  """
  @spec search(map) :: Klaviyo.Operation.t()
  def search(params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v2/people/search"
    }
  end
end
