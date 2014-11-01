defmodule AssetsPipelineEx.ReaderTest do
  use ExUnit.Case
  alias AssetsPipelineEx.Reader
  alias AssetsPipelineEx.Asset

  test "success read asset" do
    asset = %Asset{base_path: 'test/files/some_js.txt'}
    asset = Reader.read_asset(asset)
    assert asset.base_content == "function() {}\n"
  end

  test "failed read asset is file not exists" do
    asset = %Asset{base_path: 'test/files/some_js_2.txt'}
    assert_raise File.Error, fn ->
      Reader.read_asset asset
    end
  end
end
