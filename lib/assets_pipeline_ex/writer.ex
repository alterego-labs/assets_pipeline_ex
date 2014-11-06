defmodule AssetsPipelineEx.Writer do
  alias AssetsPipelineEx.Asset

  def write_asset(%Asset{new_content: content, new_path: path} = _asset) do
    File.write path, content, [:write, :utf8, :raw]
  end
end
