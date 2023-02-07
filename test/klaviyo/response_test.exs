defmodule Klaviyo.ResponseTest do
  use ExUnit.Case, async: true

  alias Klaviyo.HTTP
  alias Klaviyo.Opts
  alias Klaviyo.Response

  describe "new/2" do
    test "decodes body when content-type is \"application/vnd.api+json\"" do
      headers = [{"content-type", "application/vnd.api+json"}]
      status_code = 200

      response = %HTTP.Response{
        body: "{\"ok\": true}",
        headers: headers,
        status_code: status_code
      }

      opts = Opts.new([])

      expected = %Response{
        body: %{"ok" => true},
        headers: headers,
        status_code: status_code
      }

      assert expected == Response.new(response, opts)
    end

    test "decodes body when content-type contains more than just the MIME type" do
      headers = [{"content-type", "application/vnd.api+json;charset=utf-8"}]
      status_code = 200

      response = %HTTP.Response{
        body: "{\"ok\": true}",
        headers: headers,
        status_code: status_code
      }

      opts = Opts.new([])

      expected = %Response{
        body: %{"ok" => true},
        headers: headers,
        status_code: status_code
      }

      assert expected == Response.new(response, opts)
    end

    test "decodes body if content-type key is goobly cased" do
      headers = [{"CoNtEnT-tYpE", "application/vnd.api+json"}]
      status_code = 200

      response = %HTTP.Response{
        body: "{\"ok\": true}",
        headers: headers,
        status_code: status_code
      }

      opts = Opts.new([])

      expected = %Response{
        body: %{"ok" => true},
        headers: headers,
        status_code: status_code
      }

      assert expected == Response.new(response, opts)
    end

    test "does not decode body for an unsupported content-type" do
      body = "nope"
      headers = [{"content-type", "text/plain"}]
      status_code = 200

      response = %HTTP.Response{
        body: body,
        headers: headers,
        status_code: status_code
      }

      opts = Opts.new([])

      expected = %Response{
        body: body,
        headers: headers,
        status_code: status_code
      }

      assert expected == Response.new(response, opts)
    end

    test "does not decode body when there is no content-type" do
      body = "nope"
      headers = [{"irrelevant-header", ""}]
      status_code = 200

      response = %HTTP.Response{
        body: body,
        headers: headers,
        status_code: status_code
      }

      opts = Opts.new([])

      expected = %Response{
        body: body,
        headers: headers,
        status_code: status_code
      }

      assert expected == Response.new(response, opts)
    end
  end
end
