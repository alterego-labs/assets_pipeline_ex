defmodule AssetsPipelineEx.Mixfile do
  use Mix.Project

  def project do
    [app: :assets_pipeline_ex,
     version: "0.0.1",
     elixir: "~> 1.0.0",
     deps: deps]
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
end
