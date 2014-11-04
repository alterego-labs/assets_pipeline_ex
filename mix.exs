defmodule AssetsPipelineEx.Mixfile do
  use Mix.Project

  def project do
    [app: :assets_pipeline_ex,
     version: "0.0.1",
     elixir: "~> 1.0.0",
     description: "The asset pipeline provides a framework to pre-process JavaScripts
assets in other language such as CoffeeScript",
     deps: deps,
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      { :execjs, github: "devinus/execjs", tag: "1.1.1" }
    ]
  end

  defp package do
    [ files: ["lib", "config", "priv", "test", "mix.exs", "README.md"],
      contributors: ["Sergey Gernyak"],
      licenses: ["MIT"],
      links: %{ "GitHub": "https://github.com/alterego-labs/assets_pipeline_ex" } ]
  end
end
