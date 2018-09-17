# Klaviyo

An Elixir library for working with the Klaviyo REST API.

## Documentation

* [Latest HexDocs](https://hexdocs.pm/klaviyo)

## Installation

```elixir
def deps do
  [
    {:klaviyo, "~> 1.0"}
  ]
end
```

Out of the box, this library provides support for `hackney` as the HTTP client
and `jason` and `poison` as the JSON codecs. If you plan to utilize any of these
you will need to add them as dependencies to your project.

## Making Requests

```elixir
Klaviyo.Campaign.send("dqQnNW") |> Klaviyo.request()
```

When making requests to the Track and Identify API's you can expect to
receive a response of `:success` or `:failure`.

When making requests to all other API's you can expect to receive a response of
`{:ok, response}` or `{:error, reason}`.

## Configuration

This library can be configured globally via `Mix` or by passing configuration in
on a per-request basis.

### `Mix`

This approach is suitable for configuration that is static. If you need to
obtain values at runtime (i.e. you need access to environment variables) you
will need to provide configuration on a per-request basis.

```elixir
config :klaviyo, private_api_key: "...",
                 public_api_key: "..."
```

### Per-request

This approach is suitable if you need to provide different configuration per
request or you need to obtain configuration at runtime.

```elixir
Klaviyo.Campaign.send("dqQnNW") |> Klaviyo.request(private_api_key: "...")
```

### Configuration Options

* `:client` - HTTP client to make requests with. Defaults to
              `Klaviyo.Client.Hackney`.
* `:client_opts` - options to pass to the HTTP client when making a request.
* `:host` - host to make requests to. Defaults to `a.klaviyo.com`.
* `:json_codec` - JSON encoder and decoder. Defaults to `Jason`.
* `:port` - HTTP port to send requests over. Defaults to `nil`.
* `:private_api_key` - API key provided by Klaviyo for making requests to the
                       Metrics, Profiles, Lists, Campaigns and Templates API's.
* `:protocol` - HTTP protocol used when making requests. Defaults to `https`.
* `:public_api_key` - API key provided by Klaviyo for making requests to the
                      Identify and Track API's.

## Authentication

Klaviyo provides different authentication requirements depending on whether you
are making a request to a public API (Track and Identify) or a private API
(Metrics, Profiles, Lists, Campaigns and Templates).

This library will handle this for you automatically. The only thing you need to
do is provide the appropriate API key to the `:private_api_key` and
`:public_api_key` configuration options.

## HTTP Client

This library allows you to use the HTTP client of your choice. We provide
support for [hackney](https://github.com/benoitc/hackney) out-of-the-box. If
you would like to use a different client you may implement the
[`Klaviyo.Client`](https://hexdocs.pm/klaviyo/Klaviyo/Client.html) behaviour and
use your client with the `:client` configuration option.

As an example, please see [`Klaviyo.Client.Hackney`](https://github.com/malomohq/klaviyo-elixir/blob/master/lib/klaviyo/client/hackney.ex).

## JSON Codec

This library also allows you to use the JSON coded of your choice. We support
any library that provides `encode!/1` and `decode!\1` as the interface for
encoding and decoding JSON. As a result, `Jason` and `Poison` are supported
out-of-the-box. If you would like to use a different JSON codec that does not
adhere to this required interface you can wrap it in your own implementation.
