defmodule Klaviyo.Retry do
  alias Klaviyo.Opts
  alias Klaviyo.Request

  @callback wait_for(request :: Request.t(), opts :: Opts.t()) :: non_neg_integer
end
