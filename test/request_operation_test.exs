defmodule Klaviyo.RequestOperationTest do
  use ExUnit.Case, async: true

  alias Klaviyo.Opts
  alias Klaviyo.RequestOperation

  test "to_url/2" do
    host = "a.klaviyo.com"
    path = "/endpoint"
    query = [a: 1]
    port = 4000

    operation = %RequestOperation{path: path, query: query}

    opts = %Opts{host: host, port: port}

    expected = "#{opts.protocol}://"
    expected = expected <> host
    expected = expected <> ":#{port}"
    expected = expected <> opts.path <> path
    expected = expected <> "?#{URI.encode_query(query)}"

    assert expected == RequestOperation.to_url(operation, opts)
  end
end
