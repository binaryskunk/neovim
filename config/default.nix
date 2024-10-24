let
  files = builtins.readDir ./.;
  pluginFiles = builtins.readDir ./plugins;

  nixFiles = builtins.filter
    (name: name != "default.nix" && builtins.match ".*\\.nix" name != null)
    (builtins.attrNames files);
  plugins = builtins.filter
    (name: builtins.match ".*\\.nix" name != null)
    (builtins.attrNames pluginFiles);

  imports = (map (name: ./. + "/${name}") nixFiles) ++ (map (name: ./plugins + "/${name}") plugins);

in { imports = imports; }
