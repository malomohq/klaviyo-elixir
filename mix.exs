defmodule Klaviyo.MixProject do
  use Mix.Project

  def project do
    [
      app: :klaviyo,
      version: "2.0.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      { :hackney,  "~> 1.15", optional: true },
      { :jason,    "~> 1.1", optional: true },
      { :dialyxir, "~> 1.0.0-rc", only: :dev, runtime: false },
      { :ex_doc,   ">= 0.0.0", only: :dev, runtime: false }
    ]
  end

  defp package do
    [
      description: "Elixir client for the Klaviyo REST API",
      maintainers: ["Anthony Smith"],
      licenses: ["MIT"],
      links: %{
        GitHub: "https://github.com/malomohq/klaviyo-elixir"
      }
    ]
  end
end
