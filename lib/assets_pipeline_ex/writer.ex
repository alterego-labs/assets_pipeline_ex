require Logger
defmodule AssetsPipelineEx.Writer do
  alias AssetsPipelineEx.Asset

  def write_asset(%Asset{new_content: content, new_path: path, file: file} = _asset) do
    Logger.info "Writing compiled asset #{file} to #{path}"
    :ok = File.write path, content
  end
end
