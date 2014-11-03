defmodule Mix.Tasks.AssetsPipelineEx.Compile do
  use Mix.Task
  import Mix.Generator

  @shortdoc "Compile assets"

  @moduledoc """
  Runs assets compilation
  """

  def run(args) do
    AssetsPipelineEx.run
  end
end

