require Logger
defmodule AssetsPipelineEx.Configurator do
  @namespace :assets_pipeline_ex
  @defaults [javascripts: []]

  alias AssetsPipelineEx.Asset

  def assets_list(:js) do
     configuration_for(:javascripts) |> wrap_to_asset(:js)
  end

  def assets_list(asset_type) do
    raise AssetsPipelineEx.UnknownAssetError, message: "Unknown asset type: #{asset_type}"
  end

  def configuration_for(key) do
    key
    |> fetch_default
    |> fetch_config
  end

  defp wrap_to_asset(collection, type) do
    collection |> Enum.map &%Asset{file: &1, type: type}
  end

  defp fetch_default(key) do
    {key, @defaults[key]}
  end

  defp fetch_config({key, default}) do
    Application.get_env @namespace, key, default
  end
end
