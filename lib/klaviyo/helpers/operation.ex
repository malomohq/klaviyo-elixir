defmodule Klaviyo.Helpers.Operation do
  def put_auth(%{ auth: :private } = operation, config) do
    params =
      operation
      |> Map.get(:params)
      |> Map.put(:api_key, config.private_api_key)

    Map.put(operation, :params, params)
  end

  def put_auth(%{ auth: :public } = operation, config) do
    params =
      operation
      |> Map.get(:params)
      |> Map.put(:token, config.public_api_key)

    Map.put(operation, :params, params)
  end
end
