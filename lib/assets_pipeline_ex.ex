defmodule AssetsPipelineEx do
  alias AssetsPipelineEx.PathBuilder
  alias AssetsPipelineEx.Reader
  alias AssetsPipelineEx.Compilator
  alias AssetsPipelineEx.Writer

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
    |> PathBuilder.path_for(:js)
    |> Reader.read_asset
    |> Compilator.compile
    |> Writer.write_asset
  end
end
