defmodule Klaviyo.ListTest do
  use ExUnit.Case, async: true

  test "add_as_member/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v2/list/#{id}/members"

    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: ^path
    } = Klaviyo.List.add_as_member(id, p)
  end

  test "add_as_subscriber/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v2/list/#{id}/subscribe"

    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: ^path
    } = Klaviyo.List.add_as_subscriber(id, p)
  end

  test "all/0" do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: "v2/lists"
    } = Klaviyo.List.all()
  end

  test "all_exclusions/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v2/list/#{id}/exclusions/all"

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.List.all_exclusions(id, p)
  end

  test "all_group_members/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v2/group/#{id}/members/all"

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.List.all_group_members(id, p)
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

  test "get_memberships/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v2/list/#{id}/members"

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.List.get_memberships(id, p)
  end

  test "get_subscriptions/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v2/list/#{id}/subscribe"

    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.List.get_subscriptions(id, p)
  end

  test "remove_as_member/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v2/list/#{id}/members"

    %Klaviyo.Operation{
      auth: :private,
      method: :delete,
      params: ^p,
      path: ^path
    } = Klaviyo.List.remove_as_member(id, p)
  end

  test "remove_as_subscriber/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v2/list/#{id}/subscribe"

    %Klaviyo.Operation{
      auth: :private,
      method: :delete,
      params: ^p,
      path: ^path
    } = Klaviyo.List.remove_as_subscriber(id, p)
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
