AssetsPipelineEx
================
The asset pipeline provides a framework to pre-process JavaScripts
assets in other language such as CoffeeScript.

# How to use the assets pipeline
All compiled javascripts must be placed in `priv/assets/js` folder. Only
that files are served by AssetsPipeline.
Not compiled javascripts must be placed in `public/assets` folder.
At each server starting assets from `priv/asstes/js` folder
are automatically compiled and placed to `public/assets` folder - only
from this one assets are used for including to html folder.

#Configuration
Configuration is contained in `config/assets_pipeline_ex.exs` file. In
that one you must specify list of precompiled assets.
Also you must add handling assets by patching cowboy router like this:
```elixir
{"/assets/[...]", :cowboy_static, {:dir, "public/assets"}}
```

# Tasks

## Generate default config
Next command will generate default config file:
```shell
mix assets_pipeline_ex.gen.config
```
After that file `config/assets_pipeline_ex.exs` will be appear.

## Assets compilation
For compile all assets run next command in the shell:
```shell
mix assets_pipeline_ex.compile
```
After this all files in `priv/assets/[...]` folder will be compiled and
placed in `assets/[...]` folder.

# Acceptable pre-processors
Now only *CoffeeScript* preprocessor is available. Javascript files
written in coffeescript must be placed in `priv/assets/js` folder and
has extension *.coffee*.
