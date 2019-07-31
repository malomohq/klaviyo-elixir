defmodule Klaviyo.Helpers.JSON do
  @spec decode(iodata, Klaviyo.Config.t()) :: map
  def decode(input, config) do
    case config.json_codec.decode(input) do
      { :ok, result } ->
        result
      { :error, _reason } ->
        %{}
    end
  end

  @spec encode(term, Klaviyo.Config.t()) :: String.t()
  def encode(input, config) do
    case config.json_codec.encode(input) do
      { :ok, result } ->
        result
      { :error, _reason } ->
        ""
    end
  end
end
