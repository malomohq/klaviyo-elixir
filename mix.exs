defmodule Klaviyo.MixProject do
  use Mix.Project

  def project do
    [
      app: :klaviyo,
      version: "1.0.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_apps: [:hackney]],
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
      {:dialyxir, "~> 1.0.0-rc", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:hackney, "~> 1.14", optional: true},
      {:jason, "~> 1.1", optional: true}
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
