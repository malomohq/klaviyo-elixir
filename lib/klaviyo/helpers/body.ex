defmodule Klaviyo.Helpers.Body do
  alias Klaviyo.{ Helpers }

  def new(operation, config) do
    operation
    |> put_auth(config)
    |> Helpers.JSON.encode(config)
  end

  defp put_auth(%{ auth: :private } = operation, config) do
    Map.put(operation.body, :api_key, config.private_api_key)
  end

  defp put_auth(%{ auth: :public } = operation, config) do
    Map.put(operation.body, :token, config.public_api_key)
  end
end
