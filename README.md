# Klaviyo

An Elixir library for working with the Klaviyo REST API.

## Installation

```elixir
def deps do
  [
    {:klaviyo, "~> 2.0"},
    {:hackney, "~> 1.15"},
    {:jason, "~> 1.1"}
  ]
end
```

Note that usage of `hackney` and `jason` are optional. You may implement support
for your own HTTP library and JSON codec.

## Usage

You make a request to the Klaviyo API by passing the request description created
by resource endpoint functions (e.g. `Klaviyo.Campaign.send/1` or
`Klaviyo.track/1`) to the `Klaviyo.request/2` function.

All requests that get a response from the Klaviyo API will be returned as either
`{:ok, %Klaviyo.Response{}}` or `{:error, %Klaviyo.Response{}}`. In the event of
a client error `{:error, _reason}` will be returned.

```elixir
iex> Klaviyo.Campaign.send("dqQnNW") |> Klaviyo.request(%{ private_api_key: "..." })
{:ok, %Klaviyo.Response{body: _, headers: _, status_code: 200}}
```

## Configuration

Configuration is passed as a map to the second argument of `Klaviyo.request/2`.

* `:host` - HTTP host to make requests to. Defaults to `a.klaviyo.com`.
* `:http_client` - the HTTP client used for making requests. Defaults to
                   `Klaviyo.Client.Hackney`.
* `:http_client_opts` - additional options passed to `:http_client` when making
                        a request
* `:json_codec` - codec for encoding and decoding JSON. Defaults to `Jason`.
* `:path` - URL path prefix used when making a request

* `:port` - HTTP port used when making a request
* `:private_api_key` - the Klaviyo private API key used when making a request to
                       a resource endpoints
* `:protocol` - HTTP protocol used when making a request. Defaults to `https`.
* `:public_api_key` - the Klaviyo public API key used when making a request to
                      the track and identify endpoints

## Supported Endpoint Functions

* `Klaviyo.identify/1`
* `Klaviyo.track/1`
* `Klaviyo.track_once/1`

* `Klaviyo.Campaign.all/1`
* `Klaviyo.Campaign.all_recipients/1`
* `Klaviyo.Campaign.cancel/1`
* `Klaviyo.Campaign.clone/2`
* `Klaviyo.Campaign.create/1`
* `Klaviyo.Campaign.get/1`
* `Klaviyo.Campaign.schedule/2`
* `Klaviyo.Campaign.send/1`
* `Klaviyo.Campaign.update/2`

* `Klaviyo.List.add_as_member/2`
* `Klaviyo.List.add_as_subscriber/2`
* `Klaviyo.List.all/0`
* `Klaviyo.List.all_exclusions/2`
* `Klaviyo.List.all_group_members/2`
* `Klaviyo.List.create/1`
* `Klaviyo.List.delete/1`
* `Klaviyo.List.get/1`
* `Klaviyo.List.get_memberships/2`
* `Klaviyo.List.get_subscriptions/2`
* `Klaviyo.List.remove_as_member/2`
* `Klaviyo.List.remove_as_subscriber/2`
* `Klaviyo.List.update/2`

* `Klaviyo.Metric.all/1`
* `Klaviyo.Metric.export/2`
* `Klaviyo.Metric.timeline/1`
* `Klaviyo.Metric.timeline/2`

* `Klaviyo.Person.get/1`
* `Klaviyo.Person.timeline/2`
* `Klaviyo.Person.timeline_for_metric/3`
* `Klaviyo.Person.update/2`

* `Klaviyo.Template.all/0`
* `Klaviyo.Template.clone/2`
* `Klaviyo.Template.create/1`
* `Klaviyo.Template.delete/1`
* `Klaviyo.Template.render/2`
* `Klaviyo.Template.send/2`
* `Klaviyo.Template.update/2`
