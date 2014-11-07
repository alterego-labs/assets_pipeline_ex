require Logger
defmodule AssetsPipelineEx.PathBuilder do
  alias AssetsPipelineEx.Asset

  def asset_paths(asset) do
    Logger.info "Applying paths for asset #{asset.file}"
    asset |> apply_base_path |> apply_new_path
  end

  defp apply_base_path(%Asset{file: file, type: type} = asset) do
    {path, ext} = base_path_and_ext(type)
    base_path = path <> to_string(file) <> ext
    %{asset | base_path: base_path}
  end

  defp apply_new_path(%Asset{file: file, type: type} = asset) do
    {path, ext} = new_path_and_ext(type)
    new_path = path <> to_string(file) <> ext
    %{asset | new_path: new_path}
  end

  defp base_path_and_ext(:js) do
    {"priv/assets/js/", ".js.coffee"}
  end

  defp base_path_and_ext(type) do
    raise_unknown_asset type
  end

  defp new_path_and_ext(:js) do
    {"public/assets/", ".js"}
  end

  defp raise_unknown_asset(asset_type) do
    raise AssetsPipelineEx.UnknownAssetError, message: "Unknown asset type: #{asset_type}"
  end
end
