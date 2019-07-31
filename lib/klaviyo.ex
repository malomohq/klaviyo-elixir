defmodule Klaviyo do
  @type http_headers_t :: [{ String.t(), String.t() }]

  @type http_method_t :: :delete | :get | :post | :put

  @type http_response_t ::
          %{
            body: binary,
            headers: http_headers_t,
            status_code: pos_integer
          }

  def request(operation, config) do
    Klaviyo.Operation.perform(operation, Klaviyo.Config.new(config))
  end

  def track(params) do
    %Klaviyo.Operation{
      auth: :public,
      method: :get,
      params: params,
      path: "track"
    }
  end
end
