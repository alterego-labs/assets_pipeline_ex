defmodule AssetsPipelineEx.Compilator do
  alias AssetsPipelineEx.Asset

  def compile(%Asset{base_content: content} = asset) do
    %{asset | new_content: "#{content}-modification"}
  end
end
