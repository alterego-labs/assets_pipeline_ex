defmodule AssetsPipelineEx do
  def run do
    process_javascripts
  end

  defp process_javascripts do
    process_assets :js
  end

  defp process_assets(:js = assets_type) do
    js_files = AssetsPipelineEx.Configurator.assets_list(assets_type)
    Enum.each js_files, &process_file(&1, assets_type)
  end

  defp process_file(file, :js = assets_type) do
    file
    |> AssetsPipelineEx.PathBuilder.path_for(assets_type)
    |> AssetsPipelineEx.Reader.content
    |> AssetsPipelineEx.Compilator.compile
    |> AssetsPipelineEx.Writer.write(assets_type)
  end
end
