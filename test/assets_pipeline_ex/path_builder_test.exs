defmodule AssetsPipelineEx.PathBuilderTest do
  use ExUnit.Case

  test "success building path for js asset" do
    valid_path = "priv/assets/js/some.js.coffee"
    assert AssetsPipelineEx.PathBuilder.path_for(:some, :js) == valid_path
    assert AssetsPipelineEx.PathBuilder.path_for("some", :js) == valid_path
  end

  test "failed when passing unknown asset type" do
    assert_raise AssetsPipelineEx.UnknownAssetError, fn ->
      AssetsPipelineEx.PathBuilder.path_for :some, :jss
    end
  end
end
