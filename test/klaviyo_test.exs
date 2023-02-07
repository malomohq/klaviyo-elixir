defmodule KlaviyoTest do
  use ExUnit.Case, async: true

  alias Klaviyo.HTTP
  alias Klaviyo.RequestOperation
  alias Klaviyo.Response

  setup do
    bypass = Bypass.open()

    http_opts = [
      client: HTTP.Hackney,
      host: "localhost",
      port: bypass.port,
      protocol: "http"
    ]

    {:ok, bypass: bypass, http_opts: http_opts}
  end

  describe "send/2" do
    test "returns :ok if the response was successful", %{bypass: bypass, http_opts: http_opts} do
      Bypass.expect_once(bypass, "POST", "/endpoint", fn
        conn ->
          conn
          |> Plug.Conn.put_resp_header("content-type", "application/vnd.api+json")
          |> Plug.Conn.resp(200, ~s<{"ok":true}>)
      end)

      operation = %RequestOperation{
        body: [],
        method: :post,
        path: "/endpoint"
      }

      result = Klaviyo.send(operation, http_opts)

      assert {:ok, %Response{} = response} = result
      assert %{"ok" => true} == response.body
      assert {"content-type", "application/vnd.api+json"} in response.headers
      assert 200 == response.status_code
    end

    test "returns :error if the response was not successful", %{
      bypass: bypass,
      http_opts: http_opts
    } do
      Bypass.expect_once(bypass, "POST", "/endpoint", fn
        conn ->
          conn
          |> Plug.Conn.put_resp_header("content-type", "application/vnd.api+json")
          |> Plug.Conn.resp(400, ~s<{"ok":false}>)
      end)

      operation = %RequestOperation{
        body: [],
        method: :post,
        path: "/endpoint"
      }

      result = Klaviyo.send(operation, http_opts)

      assert {:error, %Response{} = response} = result
      assert %{"ok" => false} == response.body
      assert {"content-type", "application/vnd.api+json"} in response.headers
      assert 400 == response.status_code
    end

    test "retries if the result was unexpected", %{bypass: bypass, http_opts: http_opts} do
      Bypass.expect_once(bypass, "POST", "/endpoint", fn
        conn ->
          conn
          |> Plug.Conn.put_resp_header("content-type", "application/vnd.api+json")
          |> Plug.Conn.resp(500, ~s<{"ok":false}>)
      end)

      Bypass.expect_once(bypass, "POST", "/endpoint", fn
        conn ->
          conn
          |> Plug.Conn.put_resp_header("content-type", "application/vnd.api+json")
          |> Plug.Conn.resp(200, ~s<{"ok":true}>)
      end)

      operation = %RequestOperation{
        body: [],
        method: :post,
        path: "/endpoint"
      }

      result = Klaviyo.send(operation, http_opts)

      assert {:ok, %Response{} = response} = result
      assert %{"ok" => true} == response.body
      assert {"content-type", "application/vnd.api+json"} in response.headers
      assert 200 == response.status_code
    end
  end
end
