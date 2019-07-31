defmodule Klaviyo.Response do
  @type t ::
          %__MODULE__{
            body: map,
            headers: Klaviyo.http_headers_t(),
            status_code: pos_integer
          }

  defstruct [:body, :headers, :status_code]
end
