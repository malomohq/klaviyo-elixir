defmodule Klaviyo.HTTP.ResponseTest do
  use ExUnit.Case, async: true

  alias Klaviyo.HTTP.Response

  describe "get_header/2" do
    test "returns a header value if found" do
      body = "{\"ok\": true}"
      headers = [{"content-type", "application/vnd.api+json"}]
      status_code = 200

      response = %Response{
        body: body,
        headers: headers,
        status_code: status_code
      }

      assert "application/vnd.api+json" == Response.get_header(response, "content-type")
    end

    test "returns nil if not found" do
      body = "{\"ok\": true}"
      headers = [{"content-type", "application/vnd.api+json"}]
      status_code = 200

      response = %Response{
        body: body,
        headers: headers,
        status_code: status_code
      }

      assert nil == Response.get_header(response, "nope")
    end
  end
end
