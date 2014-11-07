defmodule Mix.Tasks.Ape.Init do
  use Mix.Task

  def run(_args) do
    File.copy cs_source_path, cs_dest_path
  end

  defp cs_source_path do
    "#{Mix.Project.deps_path}/assets_pipeline_ex/priv/coffee-script.js"
  end

  defp cs_dest_path do
    "#{Mix.Project.app_path}/priv/coffee-script.js"
  end
end
