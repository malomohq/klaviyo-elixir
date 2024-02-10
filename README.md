# Klaviyo

## Installation

`klaviyo` is published on [Hex](https://hex.pm/packages/klaviyo). Add it to
your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:klaviyo, "~> 3.0"}
  ]
end
```

## Usage

Requests can be made using the `send/2` function. This function accepts a
`Klaviyo.RequestOperation` struct as the first argument and a keyword list of
configuration options as the second argument.

Resource modules (e.g.`Klaviyo.Event`) return `Klaviyo.RequestOperation`
structs.

### Example

```elixir
iex> %Klaviyo.Event.all()
      ...> |> Klaviyo.send(
      ...>      api_key: "pk_xxx",
      ...>      revision: "2023-01-24"
      ...>    )
      {:ok, %Klaviyo.Response{}}
```

## Configuration

The `send/2` function takes a keyword list of configuration options as the
second argument. These provide the client with additional details needed to
make a request and various other options for how the client should process the
request and how it should behave.

### Options

- `:access_token` - OAuth2 access token
- `:api_key` - Public or private Klaviyo API key
- `:client` - HTTP client adapter used to make the request. Defaults to
  `Klaviyo.HTTP.Hackney`.
- `:client_opts` - Configuration options passed to the client adapter
- `:headers` - HTTP headers used when making a request
- `:host` - Hostname used when making a request. Defaults to `a.klaviyo.com`.
- `:json_codec` - Module used to encode and decode JSON. Defaults to `Jason`.
- `:path` - Base path used when building the URL to send a request to
- `:port` - HTTP port used when making a request
- `:protocol` - HTTP protocol used when making a request
- `:retry` - Module implementing a request retry strategy. Disabled when set
  to `false`. Defaults to `false`.
- `:retry_opts` - Options used to control the behavior of the retry module
- `:revision` - Revision of the API endpoint

## Retries

`klaviyo` has a built-in mechanism for retrying requests that either
return an HTTP status code of 500 or a client error. You can enable retries
by providing a module that implements the `Klaviyo.Retry` behaviour to the
`:retry` option when calling `Klaviyo.send/2`.

Currently, `klaviyo` provides a `Klaviyo.Retry.Linear` strategy for
retrying requests. This strategy will automatically retry a request on a set
interval. You can configure the interval by adding `:retry_in` with the number
of milliseconds to wait before sending another request to the `:retry_opts`
option.

**Example**

```elixir
iex> %Klaviyo.Event.all()
      ...> |> Klaviyo.send(
      ...>      api_key: "pk_xxx",
      ...>      retry: Klaviyo.Retry.Linear,
      ...>      retry_opts: [retry_in: 250],
      ...>      revision: "2023-01-24"
      ...>    )
      {:ok, %Klaviyo.Response{}}
```

The example above would retry a failed request after 250 milliseconds. By
default `Klaviyo.Retry.Linear` will retry a request immediately if
`:retry_in` has no value
