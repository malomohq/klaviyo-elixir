defmodule Klaviyo.RequestTest do
  use ExUnit.Case, async: true

  alias Klaviyo.{Opts, Request, RequestOperation}

  describe "new/2" do
    test "builds a Request struct" do
      api_key = "xxx"
      body = %{ok: true}
      host = "a.klaviyo.com"
      method = :get
      path = "/endpoint"
      port = 4000
      query = [a: 1]
      revision = "xxx"

      operation = %RequestOperation{
        body: body,
        method: method,
        path: path,
        query: query
      }

      opts = %Opts{api_key: api_key, host: host, port: port, revision: revision}

      headers = [
        {"authorization", "Klaviyo-API-Key #{api_key}"},
        {"content-type", "application/json"},
        {"revision", revision}
      ]

      url = RequestOperation.to_url(operation, opts)

      expected = %Request{
        body: opts.json_codec.encode!(body),
        headers: headers,
        method: method,
        url: url
      }

      assert expected == Request.new(operation, opts)
    end
  end
end
