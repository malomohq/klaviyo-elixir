defmodule Klaviyo.Client.Hackney do
  @behaviour Klaviyo.Client

  @spec request(
          Klaviyo.http_method_t(),
          String.t(),
          Klaviyo.http_headers_t(),
          String.t(),
          any
        ) :: { :ok, Klaviyo.http_response_t() } | { :error, any }
  def request(method, url, headers, body, opts) do
    opts = opts ++ [:with_body]

    response =
      :hackney.request(
        method,
        url,
        headers,
        body,
        opts
      )

      package(response)
  end

  defp package({ :ok, status_code, headers }) do
    response = %{ body: "", headers: headers, status_code: status_code }

    { :ok, response }
  end

  defp package({ :ok, status_code, headers, body }) do
    response = %{ body: body, headers: headers, status_code: status_code }

    { :ok, response }
  end

  defp package(otherwise) do
    otherwise
  end
end
