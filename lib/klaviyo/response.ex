defmodule Klaviyo.Response do
  alias Klaviyo.{ Helpers }

  @type t ::
          %__MODULE__{
            body: map | 0 | 1,
            headers: Klaviyo.http_headers_t(),
            status_code: pos_integer
          }

  defstruct [:body, :headers, :status_code]

  @spec new(Klaviyo.http_response_t(), Klaviyo.Config.t()) :: t
  def new(response, config) do
    body =
      response
      |> Map.get(:body)
      |> Helpers.JSON.decode(config)

    %__MODULE__{
      body: body,
      headers: Map.get(response, :headers),
      status_code: Map.get(response, :status_code)
    }
  end
end
