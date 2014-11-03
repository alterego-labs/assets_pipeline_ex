defmodule AssetsPipelineEx.Compilator do
  alias AssetsPipelineEx.Asset

  def compile(%Asset{base_content: content} = asset) do
    %{asset | new_content: coffeescript_compile(content)}
  end

  defp coffeescript_compile(content) do
    js_context |> Execjs.call("CoffeeScript.compile", [content])
  end

  defp js_context do
    cs_source |> Execjs.compile
  end

  defp cs_source do
    {:ok, content} = File.read "priv/coffee-script.js"
    content
  end
end
