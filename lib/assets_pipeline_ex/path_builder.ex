defmodule AssetsPipelineEx.PathBuilder do
  def path_for(filename, :js = asset_type) do
    filename
    |> to_string
    |> apply_path_and_ext(asset_type)
  end

  def path_for(_filename, asset_type) do
    raise_unknown_asset asset_type
  end

  defp apply_path_and_ext(filename, asset_type) do
    {base_path, ext} = base_path_and_ext(asset_type)
    base_path <> filename <> ext
  end

  defp base_path_and_ext(:js) do
    {"priv/assets/js/", ".js.coffee"}
  end

  defp raise_unknown_asset(asset_type) do
    raise AssetsPipelineEx.UnknownAssetError, message: "Unknown asset type: #{asset_type}"
  end
end
