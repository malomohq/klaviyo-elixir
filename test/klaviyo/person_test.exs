defmodule Klaviyo.PersonTest do
  use ExUnit.Case, async: true

  test "exchange/1" do
    exchange_id = "1"

    path = "v2/people/exchange?_kx=#{exchange_id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      path: ^path
    } = Klaviyo.Person.exchange(exchange_id)
  end

  test "get/1" do
    id = "1"

    path = "v1/person/#{id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: ^path
    } = Klaviyo.Person.get(id)
  end

  test "search/1" do
    path = "v2/people/search"

    p = %{a: "b"}

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.Person.search(p)
  end

  test "timeline/2" do
    id = "1"

    p = %{a: "b"}

    path = "v1/person/#{id}/metrics/timeline"

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.Person.timeline(id, p)
  end

  test "timeline_for_type/3" do
    person_id = "1"
    metric_id = "2"

    p = %{a: "b"}

    path = "v1/person/#{person_id}/metric/#{metric_id}/timeline"

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.Person.timeline_for_type(person_id, metric_id, p)
  end

  test "update/2" do
    id = "1"

    p = %{a: "b"}

    path = "v1/person/#{id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :put,
      params: ^p,
      path: ^path
    } = Klaviyo.Person.update(id, p)
  end
end
