defmodule AssetsPipelineEx.ConfiguratorTest do
  use ExUnit.Case
  alias AssetsPipelineEx.Configurator

  @config_namespace :assets_pipeline_ex

  test "success read default value for key" do
    assert Configurator.configuration_for(:key) == nil
  end

  test "success read putted value for key" do
    Application.put_env @config_namespace, :jss, [:file]
    assert Configurator.configuration_for(:jss) == [:file]
  end

  test "success read default value for javascripts" do
    assert Configurator.assets_list(:js) == []
  end

  test "success read putted value for javascripts" do
    Application.put_env @config_namespace, :javascripts, [:file]
    assets = Configurator.assets_list(:js)
    assert Enum.count(assets) == 1
    asset = List.first assets
    assert asset.file == :file
    assert asset.type == :js
    Application.delete_env @config_namespace, :javascripts
  end

  test "failes when trying read value for unknown asset" do
    assert_raise AssetsPipelineEx.UnknownAssetError, fn ->
      Configurator.assets_list(:jss)
    end
  end
end
