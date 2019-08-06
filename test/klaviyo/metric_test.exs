defmodule Klaviyo.MetricTest do
  use ExUnit.Case, async: true

  test "all/1" do
    p = %{ a: "b" }

    assert %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: "v1/metrics"
    } = Klaviyo.Metric.all(p)
  end

  test "export/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/metric/#{id}/export"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.Metric.export(id, p)
  end

  test "timeline/1" do
    p = %{ a: "b" }

    assert %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: "v1/metrics/timeline"
    } = Klaviyo.Metric.timeline(p)
  end

  test "timeline_for_type/2" do
    id = "1"

    p = %{ a: "b" }

    path = "v1/metric/#{id}/timeline"

    assert %Klaviyo.Operation{
      auth: :private,
      method: :get,
      params: ^p,
      path: ^path
    } = Klaviyo.Metric.timeline_for_type(id, p)
  end
end
