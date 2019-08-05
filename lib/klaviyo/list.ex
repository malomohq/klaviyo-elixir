defmodule Klaviyo.List do
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
