defmodule Klaviyo.CampaignTest do
  use ExUnit.Case, async: true

  test "all/1" do
    p = %{ a: "b" }

    assert %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: "v1/campaigns"
    } = Klaviyo.Campaign.all(p)
  end

  test "all_recipients/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/campaign/#{id}/recipients"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.Campaign.all_recipients(id, p)
  end

  test "cancel/1" do
    id = "1"

    path = "v1/campaign/#{id}/cancel"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :post,
      path: ^path
    } = Klaviyo.Campaign.cancel(id)
  end

  test "clone/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/campaign/#{id}/clone"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: ^path
    } = Klaviyo.Campaign.clone(id, p)
  end

  test "create/1" do
    p = %{ a: "b" }

    assert %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: "v1/campaigns"
    } = Klaviyo.Campaign.create(p)
  end

  test "get/1" do
    id = "1"

    path = "v1/campaign/#{id}"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: ^path
    } = Klaviyo.Campaign.get(id)
  end

  test "schedule/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/campaign/#{id}/schedule"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: ^path
    } = Klaviyo.Campaign.schedule(id, p)
  end

  test "send/1" do
    id = "1"

    path = "v1/campaign/#{id}/send"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :post,
      path: ^path
    } = Klaviyo.Campaign.send(id)
  end

  test "update/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/campaign/#{id}"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :put,
      params: ^p,
      path: ^path
    } = Klaviyo.Campaign.update(id, p)
  end
end
