defmodule Mix.Tasks.AssetsPipelineEx.Compile do
  use Mix.Task
  import Mix.Generator

  @shortdoc "Compile assets"
  @recursive true

  @moduledoc """
  Runs assets compilation
  """

  def run(args) do
    AssetsPipelineEx.run
  end
end

