require Logger
defmodule AssetsPipelineEx.Configurator do
  @namespace :assets_pipeline_ex
  @defaults [javascripts: []]

  def assets_list(:js) do
    configuration_for :javascripts
  end

  def assets_list(asset_type) do
    Logger.error "Unknown #{asset_type} asset type"
    raise AssetsPipelineEx.UnknownAssetError, message: "Unknown asset type: #{asset_type}"
  end

  def configuration_for(key) do
    key
    |> fetch_default
    |> fetch_config
  end

  defp fetch_default(key) do
    {key, @defaults[key]}
  end

  defp fetch_config({key, default}) do
    Application.get_env @namespace, key, default
  end
end
