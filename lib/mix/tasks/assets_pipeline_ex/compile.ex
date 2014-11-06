defmodule Mix.Tasks.AssetsPipelineEx.Compile do
  use Mix.Task

  @shortdoc "Compile assets"
  @recursive true
  @hidden false

  @moduledoc """
  Runs assets compilation
  """

  def run(_args) do
    AssetsPipelineEx.run
  end
end

