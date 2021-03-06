defmodule AssetsPipelineEx.CompilatorTest do
  use ExUnit.Case
  alias AssetsPipelineEx.Asset
  alias AssetsPipelineEx.Compilator

  test "success compile passing asset" do
    asset = %Asset{base_content: "some"}
    assert Compilator.compile(asset).new_content == "(function() {\n  some;\n\n\n}).call(this);\n"
  end
end
