defmodule Klaviyo.RequestTest do
  use ExUnit.Case, async: true

  alias Klaviyo.{ Config, Operation, Request, Response }

  setup do
    bypass = Bypass.open()

    config = Config.new(%{ host: "localhost", port: bypass.port, private_api_key: "xxx", protocol: "http" })

    operation = %Operation{ auth: :private, method: :post, params: %{ var: "a" }, path: "fake" }

    %{ bypass: bypass, config: config, operation: operation}
  end

  describe "send/3" do
    test "returns { :ok, %Klaviyo.Response{} } when response has an HTTP status code of 200", tags do
      bypass = Map.get(tags, :bypass)
      config = Map.get(tags, :config)
      operation = Map.get(tags, :operation)

      Bypass.expect(bypass, fn(conn) -> Plug.Conn.send_resp(conn, 200, "{\"ok\":true}") end)

      assert { :ok, %Response{} } = Request.send(operation, config)
    end

    test "returns { :error, %Klaviyo.Response{} } when response has an HTTP status code of 400", tags do
      bypass = Map.get(tags, :bypass)
      config = Map.get(tags, :config)
      operation = Map.get(tags, :operation)

      Bypass.expect(bypass, fn(conn) -> Plug.Conn.send_resp(conn, 400, "{\"ok\":false}") end)

      assert { :error, %Response{} } = Request.send(operation, config)
    end

    test "makes a request", tags do
      bypass = Map.get(tags, :bypass)
      config = Map.get(tags, :config)
      operation = Map.get(tags, :operation)

      Bypass.expect(bypass, fn
        (conn) ->
          conn_opts = Plug.Parsers.init([json_decoder: Jason, parsers: [:json, :urlencoded], pass: ["*/*"]])

          conn = Plug.Parsers.call(conn, conn_opts)

          assert conn.body_params == %{ "api_key" => "xxx", "var" => "a" }
          assert conn.method == "POST"

          Plug.Conn.send_resp(conn, 200, "{\"ok\":true}")
      end)

      Request.send(operation, config)
    end

    test "does not retry when status code is 200", tags do
      bypass = Map.get(tags, :bypass)
      config = Map.get(tags, :config)
      operation = Map.get(tags, :operation)

      Bypass.expect(bypass, fn
        (conn) ->
          conn_opts = Plug.Parsers.init([json_decoder: Jason, parsers: [:json, :urlencoded], pass: ["*/*"]])

          conn = Plug.Parsers.call(conn, conn_opts)

          Plug.Conn.send_resp(conn, 200, "{\"ok\":true}")
      end)

      config = Map.merge(config, %{ retry: true })

      assert { :ok, %Response{ private: %{ attempts: 1 } } } = Request.send(operation, config)
    end

    test "does not retry when status code is 400", tags do
      bypass = Map.get(tags, :bypass)
      config = Map.get(tags, :config)
      operation = Map.get(tags, :operation)

      Bypass.expect(bypass, fn
        (conn) ->
          conn = Plug.Parsers.call(conn, Plug.Parsers.init([json_decoder: Jason, parsers: [:json], pass: ["*/*"]]))

          Plug.Conn.send_resp(conn, 400, "{\"ok\":true}")
      end)

      config = Map.merge(config, %{ retry: true })

      assert { :error, %Response{ private: %{ attempts: 1 } } } = Request.send(operation, config)
    end

    test "retries when status code is 500", tags do
      bypass = Map.get(tags, :bypass)
      config = Map.get(tags, :config)
      operation = Map.get(tags, :operation)

      Bypass.expect(bypass, fn
        (conn) ->
          conn = Plug.Parsers.call(conn, Plug.Parsers.init([json_decoder: Jason, parsers: [:json], pass: ["*/*"]]))

          Plug.Conn.send_resp(conn, 500, "{\"ok\":false}")
      end)

      config = Map.merge(config, %{ retry: true, retry_opts: [max_attempts: 3] })

      assert { :error, %Response{ private: %{ attempts: 3 } } } = Request.send(operation, config)
    end
  end
end
