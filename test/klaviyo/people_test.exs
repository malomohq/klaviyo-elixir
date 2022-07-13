defmodule Klaviyo.PeopleTest do
  use ExUnit.Case, async: true

  test "search/1" do
    id = "1"

    path = "v2/people/search"

    p = %{a: "b"}

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.People.search(p)
  end
end
