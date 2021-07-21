defmodule KlaviyoTest do
  use ExUnit.Case, async: true

  alias Klaviyo.{ Operation, Response }

  test "identify/1" do
    p = %{ a: "b" }

    assert %Operation{
      auth: :public,
      method: :get,
      params: ^p,
      path: "identify"
    } = Klaviyo.identify(p)
  end

  test "identify_post/1" do
    p = %{ a: "b" }

    assert %Operation{
      auth: :public,
      method: :post,
      params: ^p,
      path: "identify"
    } = Klaviyo.identify_post(p)
  end

  test "request/2" do
    bypass = Bypass.open()

    config = %{ host: "localhost", port: bypass.port, protocol: "http" }

    Bypass.expect(bypass, fn(conn) -> Plug.Conn.send_resp(conn, 200, "{\"ok\":true}") end)

    operation = %Operation{ auth: :private, method: :get, path: "fake" }

    assert { :ok, %Response{} } = Klaviyo.request(operation, config)
  end

  test "track/1" do
    p = %{ a: "b" }

    assert %Operation{
      auth: :public,
      method: :get,
      params: ^p,
      path: "track"
    } = Klaviyo.track(p)
  end

  test "track_once/1" do
    p = %{ a: "b" }

    assert %Operation{
      auth: :public,
      method: :get,
      params: ^p,
      path: "track-once"
    } = Klaviyo.track_once(p)
  end

  test "track_post/1" do
    p = %{ a: "b" }

    assert %Operation{
      auth: :public,
      method: :post,
      params: ^p,
      path: "track"
    } = Klaviyo.track_post(p)
  end
end
