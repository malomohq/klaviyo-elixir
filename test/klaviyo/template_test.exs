defmodule Klaviyo.TemplateTest do
  use ExUnit.Case, async: true

  test "all/0" do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: "v1/email-templates"
    } = Klaviyo.Template.all()
  end

  test "clone/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/email-template/#{id}/clone"

    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: ^path
    } = Klaviyo.Template.clone(id, p)
  end

  test "create/1" do
    p = %{ a: "b" }

    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: "v1/email-templates"
    } = Klaviyo.Template.create(p)
  end

  test "delete/1" do
    id = "1"

    path = "v1/email-template/#{id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :delete,
      path: ^path
    } = Klaviyo.Template.delete(id)
  end

  test "render/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/email-template/#{id}/render"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: ^path
    } = Klaviyo.Template.render(id, p)
  end

  test "send/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/email-template/#{id}/send"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: ^p,
      path: ^path
    } = Klaviyo.Template.send(id, p)
  end

  test "update/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/email-template/#{id}"

    %Klaviyo.Operation{
      auth: :private,
      method: :put,
      params: ^p,
      path: ^path
    } = Klaviyo.Template.update(id, p)
  end
end
