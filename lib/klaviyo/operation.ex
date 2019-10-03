defmodule Klaviyo.Operation do
  @type t ::
          %__MODULE__{
            auth: :private | :public,
            method: Klaviyo.http_method_t(),
            params: map,
            path: String.t()
          }

  defstruct auth: nil,
            method: nil,
            params: %{},
            path: nil
end
