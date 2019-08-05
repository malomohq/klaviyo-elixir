defmodule Klaviyo do
  @type http_headers_t :: [{ String.t(), String.t() }]

  @type http_method_t :: :delete | :get | :post | :put

  @type http_response_t ::
          %{
            body: binary,
            headers: http_headers_t,
            status_code: pos_integer
          }

  @doc """
  Makes a request to the Klaviyo API.
  """
  @spec request(Klaviyo.Operation.t(), Klaviyo.Config.t()) ::
        { :ok, Klaviyo.Response.t() } | { :error, Klaviyo.Response.t() | any }
  def request(operation, config) do
    Klaviyo.Operation.perform(operation, Klaviyo.Config.new(config))
  end

  @doc """
  Track properties about an individual without tracking an associated event.
  """
  @spec identify(map) :: Klaviyo.Operation.t()
  def identify(params) do
    %Klaviyo.Operation{
      auth: :public,
      method: :get,
      params: params,
      path: "identify"
    }
  end

  @doc """
  Track when someone takes an action or does something.
  """
  @spec track(map) :: Klaviyo.Operation.t()
  def track(params) do
    %Klaviyo.Operation{
      auth: :public,
      method: :get,
      params: params,
      path: "track"
    }
  end

  @doc """
  Tracks the first occurance of when someone takes an action or does something.
  """
  @spec track_once(map) :: Klaviyo.Operation.t()
  def track_once(params) do
    %Klaviyo.Operation{
      auth: :public,
      method: :get,
      params: params,
      path: "track-once"
    }
  end
end
