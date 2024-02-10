defmodule Klaviyo.Opts do
  @moduledoc """
  Configuration needed by the HTTP client.
  """

  alias Klaviyo.{HTTP}

  @type t ::
          %__MODULE__{
            access_token: String.t(),
            api_key: String.t(),
            client: module,
            client_opts: keyword,
            headers: HTTP.headers_t(),
            host: String.t(),
            json_codec: module,
            path: String.t(),
            port: pos_integer,
            protocol: String.t(),
            retry: boolean | module,
            retry_opts: keyword,
            revision: String.t()
          }

  defstruct access_token: nil,
            api_key: nil,
            client: HTTP.Hackney,
            client_opts: [],
            headers: [],
            host: "a.klaviyo.com",
            json_codec: Jason,
            path: "",
            port: nil,
            protocol: "https",
            retry: false,
            retry_opts: [],
            revision: nil

  @doc """
  Builds a `Klaviyo.Opts` struct.

  Any options passed into this function will override struct defaults.
  """
  @spec new(keyword) :: t
  def new(opts) do
    struct!(__MODULE__, Enum.into(opts, %{}))
  end
end
