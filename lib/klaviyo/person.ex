defmodule Klaviyo.Person do
  @moduledoc """
  Provides support for the Klaviyo Profiles API.

  This module provides access to all known endpoints of the v1 Profiles API.
  """

  @doc """
  Add or update one or more attributes of a person.
  """
  @spec update(String.t(), map) :: Klaviyo.Operation.t()
  def update(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :put,
      params: params,
      path: "v1/person/#{id}"
    }
  end

  @doc """
  Batched timeline of all events for a person.
  """
  @spec timeline_for_all_event_types(String.t(), map) :: Klaviyo.Operation.t()
  def timeline_for_all_event_types(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/person/#{id}/metrics/timeline"
    }
  end

  @doc """
  Batched timeline of a single metric type for a person.
  """
  @spec timeline_for_event_type(String.t(), String.t(), map) :: Klaviyo.Operation.t()
  def timeline_for_event_type(person_id, metric_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      params: params,
      path: "v1/person/#{person_id}/metrics/#{metric_id}/timeline"
    }
  end
end
