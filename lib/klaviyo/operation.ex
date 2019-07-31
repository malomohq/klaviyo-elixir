defmodule Klaviyo.Operation do
  @type t ::
          %__MODULE__{
            auth: :private | :public,
            headers: Klaviyo.http_headers_t(),
            method: Klaviyo.http_method_t(),
            params: map,
            path: String.t()
          }

  defstruct auth: nil,
            headers: [],
            method: nil,
            params: %{},
            path: nil
end
