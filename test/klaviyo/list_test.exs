defmodule Klaviyo.ListTest do
  use ExUnit.Case, async: true

  test "all/0" do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: "v2/lists"
    } = Klaviyo.List.all()
  end

  test "create/1" do
    p = %{ a: "b" }

    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: "v2/lists"
    } = Klaviyo.List.create(p)
  end

  test "delete/1" do
    id = "1"

    path = "v2/list/#{id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :delete,
      path: ^path
    } = Klaviyo.List.delete(id)
  end

  test "get/1" do
    id = "1"

    path = "v2/list/#{id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: ^path
    } = Klaviyo.List.get(id)
  end

  test "update/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v2/list/#{id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :put,
      params: ^p,
      path: ^path
    } = Klaviyo.List.update(id, p)
  end
end
