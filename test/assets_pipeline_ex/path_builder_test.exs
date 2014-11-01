defmodule AssetsPipelineEx.PathBuilderTest do
  use ExUnit.Case
  alias AssetsPipelineEx.Asset

  test "success building path for js asset" do
    base_path = "priv/assets/js/some.js.coffee"
    new_path = "public/assets/some.js"
    asset = %Asset{file: :some, type: :js}
    asset = AssetsPipelineEx.PathBuilder.asset_paths(asset)
    assert asset.base_path == base_path
    assert asset.new_path == new_path
  end

  test "failed when passing unknown asset type" do
    asset = %Asset{file: :some, type: :jss}
    assert_raise AssetsPipelineEx.UnknownAssetError, fn ->
      AssetsPipelineEx.PathBuilder.asset_paths asset
    end
  end
end
