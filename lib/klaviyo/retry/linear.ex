defmodule Klaviyo.Retry.Linear do
  @behaviour Klaviyo.Retry

  @impl true
  def wait_for(_request, opts) do
    Keyword.get(opts.retry_opts, :retry_in, 0)
  end
end
