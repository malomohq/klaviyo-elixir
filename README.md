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

### Example

      iex> %Klaviyo.RequestOperation{}
      ...> |> Map.put(:method, :get)
      ...> |> Map.put(:path, "/api/events")
      ...> |> Klaviyo.send(api_key: "pk_xxx", revision: "2023-01-24")
      {:ok, %Klaviyo.Response{}}

## Configuration

The `send/2` function takes a keyword list of configuration options as the
second argument. These provide the client with additional details needed to
make a request and various other options for how the client should process the
request and how it should behave.

### Options

- `:api_key` Public or private Klaviyo API key
- `:client` - HTTP client adapter used to make the request. Defaults to
  `Klaviyo.HTTP.Hackney`.
- `:client_opts` - Configuration options passed to the client adapter
- `:headers` - HTTP headers used when making a request
- `:host` - Hostname used when making a request. This field is required.
- `:json_codec` - Module used to encode and decode JSON. Defaults to `Jason`.
- `:path` - Base path used when building the URL to send a request to
- `:port` - HTTP port used when making a request
- `:protocol` - HTTP protocol used when making a request
- `:retry` - Module implementing a request retry strategy. Disabled when set
  to `false`. Defaults to `false`.
- `:retry_opts` - Options used to control the behavior of the retry module
- `:revision` - Revision of the API endpoint
