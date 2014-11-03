defmodule AssetsPipelineEx.Compilator do
  use ExUnit.Case
  alias AssetsPipelineEx.Asset
  alias AssetsPipelineEx.Compilator

  test "success compile passing asset" do
    asset = %Asset{base_content: "some-js"}
    assert Compilator.compile(asset).new_content == "some-js-modification"
  end
end
