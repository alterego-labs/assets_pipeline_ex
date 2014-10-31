defmodule AssetsPipelineEx.Reader do
  def content(path) do
    File.read! path
  end
end
