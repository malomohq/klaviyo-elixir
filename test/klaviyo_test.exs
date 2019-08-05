defmodule KlaviyoTest do
  use ExUnit.Case, async: true

  test "identify/1" do
    p = %{ a: "b" }

    assert %Klaviyo.Operation{
      auth: :public,
      method: :get,
      params: ^p,
      path: "identify"
    } = Klaviyo.identify(p)
  end

  test "track/1" do
    p = %{ a: "b" }

    assert %Klaviyo.Operation{
      auth: :public,
      method: :get,
      params: ^p,
      path: "track"
    } = Klaviyo.track(p)
  end

  test "track_once/1" do
    p = %{ a: "b" }

    assert %Klaviyo.Operation{
      auth: :public,
      method: :get,
      params: ^p,
      path: "track-once"
    } = Klaviyo.track_once(p)
  end
end
