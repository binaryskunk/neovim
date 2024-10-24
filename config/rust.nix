{ pkgs, ... }: {
  plugins.rustaceanvim = {
    enable = true;
    settings = {
      dap.adapter = {
        command = "${pkgs.lldb_19}/bin/lldb-dap";
        type = "executable";
      };

      tools.enable_clippy = true;

      server.default_settings = {
        inlayHints.lifetimeElisionHints.enable = "always";

        rust-analyzer = {
          cargo.allFeatures = true;
          check.command = "clippy";
        };
      };
    };
  };

  plugins.dap.adapters.executables.lldb.command = "${pkgs.lldb_19}/bin/lldb-dap";
}
