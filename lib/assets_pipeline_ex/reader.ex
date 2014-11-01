defmodule AssetsPipelineEx.Reader do
  alias AssetsPipelineEx.Asset

  def read_asset(%Asset{base_path: path} = asset) do
    content = path |> file_content
    %{asset | base_content: content}
  end

  def file_content(path) do
    File.read! path
  end
end
