{
  globals.mapleader = " ";

  keymaps =
  let
    mkKey = mode: key: action: desc: {
      mode = mode;
      key = key;
      action = action;

      options.desc = desc;
    };

  in [
    # Copy to clipboard
    (mkKey "v" "<leader>y" "\"+y" "Copy to clipboard")
    (mkKey "n" "<leader>y" "\"+y" "Copy to clipboard")

    # Paste from clipboard
    (mkKey "v" "<leader>p" "\"+p" "Paste from clipboard")
    (mkKey "n" "<leader>p" "\"+p" "Paste from clipboard")

    # LSP actions
    (mkKey "n" "<leader>gd" "<CMD>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<CR>" "Goto definition")
    (mkKey "n" "<leader>gr" "<CMD>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<CR>" "References")
    (mkKey "n" "<leader>gi" "<CMD>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<CR>" "Goto implementation")
    (mkKey "n" "<leader>gt" "<CMD>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<CR>" "Goto type definition")
    (mkKey "n" "<leader>pd" "<CMD>lua vim.diagnostic.open_float()<CR>" "Popup diagnostics")
    (mkKey "n" "<leader>pD" "<CMD>Trouble diagnostics toggle<CR>" "List all diagnostics")

    # DAP Telescope actions
    (mkKey "n" "<leader>d/c" "<CMD>Telescope dap commands<CR>" "Search debugging commands")
    (mkKey "n" "<leader>d/b" "<CMD>Telescope dap list_breakpoints<CR>" "Search breakpoints")
    (mkKey "n" "<leader>d/v" "<CMD>Telescope dap variables<CR>" "Search variables")
    (mkKey "n" "<leader>d/f" "<CMD>Telescope dap frames<CR>" "Search frames")
  ];
}
