defmodule AssetsPipelineEx do
  def run do
    process_javascripts
  end

  defp process_javascripts do
    process_assets :js
  end

  defp process_assets(:js = assets_type) do
    js_assets = AssetsPipelineEx.Configurator.assets_list(assets_type)
    Enum.each js_assets, &process_asset(&1)
  end

  defp process_asset(asset) do
    asset
    |> AssetsPipelineEx.PathBuilder.path_for(:js)
    |> AssetsPipelineEx.Reader.content
    |> AssetsPipelineEx.Compilator.compile
    |> AssetsPipelineEx.Writer.write(:js)
  end
end
