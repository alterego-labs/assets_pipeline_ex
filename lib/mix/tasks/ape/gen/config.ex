defmodule Mix.Tasks.Ape.Gen.Config do
  use Mix.Task
  import Mix.Generator

  @shortdoc "Creates AssetsPipelineEx config file"
  @recursive true
  @hidden false

  @moduledoc """
  Creates AssetsPipelineEx config file
  """

  def run(_args) do
    create_config_file
  end

  defp create_config_file do
    create_file "config/assets_pipeline_ex.exs", config_template([])
  end

  embed_template :config, ~S"""
  use Mix.Config
  #Specify list of compiling assets
  config :assets_pipeline_ex, :javascripts, []
  """
end
