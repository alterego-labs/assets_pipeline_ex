defmodule Mix.Tasks.AssetsPipelineEx.Gen.Config do
  use Mix.Task
  import Mix.Generator

  @shortdoc "Creates AssetsPipelineEx config file"
  @recursive true

  @moduledoc """
  Creates AssetsPipelineEx config file
  """

  def run(args) do
    create_config_file
  end

  defp create_config_file do
    create_file "config/assets_pipeline_ex.exs", config_template([])
  end

  embed_template :config, ~S"""
  #Specify list of compiling assets
  config :assets_pipeline_ex, :javascripts, []
  """
end
