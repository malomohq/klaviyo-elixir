defmodule Klaviyo.Person do
  @doc """
  Exchange an encrypted identifier for a profile ID.
  """
  @spec exchange(String.t()) :: Klaviyo.Operation.t()
  def exchange(exchange_id) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      path: "v2/people/exchange?_kx=#{exchange_id}"
    }
  end

  @doc """
  Retrieve a person.
  """
  @spec get(String.t()) :: Klaviyo.Operation.t()
  def get(person_id) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: "v1/person/#{person_id}"
    }
  end

  @doc """
  Retrieve a person's Klaviyo ID.
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

  @doc """
  Returns a batched timeline of all events.
  """
  @spec timeline(String.t(), map) :: Klaviyo.Operation.t()
  def timeline(person_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v1/person/#{person_id}/metrics/timeline"
    }
  end

  @doc """
  Reeturns a batched timline of all events for one specific type of metric.
  """
  @spec timeline_for_type(String.t(), String.t(), map) :: Klaviyo.Operation.t()
  def timeline_for_type(person_id, metric_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: params,
      path: "v1/person/#{person_id}/metric/#{metric_id}/timeline"
    }
  end

  @doc """
  Add or update one or more attributes.

  If an attribute already exists it will be updated. If an attribute does not
  exist it will be added.
  """
  @spec update(String.t(), map) :: Klaviyo.Operation.t()
  def update(person_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :put,
      params: params,
      path: "v1/person/#{person_id}"
    }
  end
end
