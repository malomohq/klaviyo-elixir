defmodule Klaviyo.Config do
  @moduledoc false

  defstruct client: Klaviyo.Client.Hackney,
            client_opts: nil,
            host: "a.klaviyo.com",
            json_codec: Jason,
            path: "api",
            port: nil,
            private_api_key: nil,
            protocol: "https",
            public_api_key: nil

  @type t :: %__MODULE__{
          client: atom,
          client_opts: any,
          host: String.t(),
          json_codec: atom,
          path: String.t(),
          port: pos_integer,
          private_api_key: String.t(),
          protocol: String.t(),
          public_api_key: String.t()
        }

  def new(overrides \\ []) do
    config =
      overrides
      |> Enum.into(%{})
      |> Map.merge(app_config())

    struct(__MODULE__, config)
  end

  defp app_config do
    Enum.into(Application.get_all_env(:klaviyo), %{})
  end
end
