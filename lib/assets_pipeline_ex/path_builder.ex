defmodule AssetsPipelineEx.PathBuilder do
  def path_for(filename, :js = asset_type) do
    filename
    |> to_string
    |> apply_path_and_ext(asset_type)
  end

  defp apply_path_and_ext(filename, asset_type) do
    base_path(asset_type) <> filename <> extension(asset_type)
  end

  defp base_path(:js) do
    "priv/assets/js/"
  end

  defp extension(:js) do
    ".js.coffee"
  end
end
