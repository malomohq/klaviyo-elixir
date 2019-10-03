defmodule Klaviyo.Response do
  alias Klaviyo.{ Config, Helpers }

  @type t ::
          %__MODULE__{
            body: map | 0 | 1,
            headers: Klaviyo.http_headers_t(),
            private: map,
            status_code: pos_integer
          }

  defstruct [body: nil, headers: nil, private: %{}, status_code: nil]

  @spec new(Klaviyo.http_response_t(), map, Config.t()) :: t
  def new(response, private, config) do
    body =
      response
      |> Map.get(:body)
      |> Helpers.JSON.decode(config)

    %__MODULE__{
      body: body,
      headers: Map.get(response, :headers),
      private: private,
      status_code: Map.get(response, :status_code)
    }
  end
end
