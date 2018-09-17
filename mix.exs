defmodule Klaviyo.MixProject do
  use Mix.Project

  def project do
    [
      app: :klaviyo,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 1.0.0-rc", only: [:dev, :test], runtime: false},
      {:hackney, "~> 1.14", optional: true},
      {:jason, "~> 1.1", optional: true}
    ]
  end
end
