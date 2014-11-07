defmodule AssetsPipelineEx do
  alias AssetsPipelineEx.PathBuilder
  alias AssetsPipelineEx.Reader
  alias AssetsPipelineEx.Compilator
  alias AssetsPipelineEx.Writer
  alias AssetsPipelineEx.Configurator

  def run do
    process_javascripts
  end

  defp process_javascripts do
    process_assets :js
  end

  defp process_assets(:js = assets_type) do
    Configurator.assets_list(assets_type)
    |> Enum.each &process_asset(&1)
  end

  defp process_asset(asset) do
    asset
    |> PathBuilder.asset_paths
    |> Reader.read_asset
    |> Compilator.compile
    |> Writer.write_asset
  end
end
