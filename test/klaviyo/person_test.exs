defmodule Klaviyo.PersonTest do
  use ExUnit.Case, async: true

  test "get/1" do
    id = "1"

    path = "v1/person/#{id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: ^path
    } = Klaviyo.Person.get(id)
  end

  test "timeline/2" do
    id = "1"

    p = %{ a: "b" }

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

    p = %{ a: "b" }

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

    p = %{ a: "b" }

    path = "v1/person/#{id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :put,
      params: ^p,
      path: ^path
    } = Klaviyo.Person.update(id, p)
  end
end
