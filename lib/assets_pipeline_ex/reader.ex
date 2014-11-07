require Logger
defmodule AssetsPipelineEx.Reader do
  alias AssetsPipelineEx.Asset

  def read_asset(%Asset{base_path: path, file: file} = asset) do
    Logger.info "Reading asset #{file} from #{path}"
    content = path |> file_content
    %{asset | base_content: content}
  end

  def file_content(path) do
    File.read! path
  end
end
