defmodule Klaviyo.Config do
  @type t ::
          %__MODULE__{
            host: String.t(),
            http_client: module,
            http_client_opts: any,
            json_codec: module,
            path: String.t(),
            port: pos_integer,
            private_api_key: String.t(),
            protocol: String.t(),
            public_api_key: String.t()
          }

  defstruct host: "a.klaviyo.com",
            http_client: Klaviyo.Client.Hackney,
            http_client_opts: [],
            json_codec: Jason,
            path: "api",
            port: nil,
            private_api_key: nil,
            protocol: "https",
            public_api_key: nil

  @spec new(map) :: t
  def new(overrides \\ %{}), do: Map.merge(%__MODULE__{}, overrides)
end
