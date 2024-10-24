{ pkgs, ... }: {
  plugins = {
    cmp-dap.enable = true;

    dap = {
      enable = true;

      extensions = {
        dap-ui = {
	  enable = true;
	  floating.mappings.close = ["<ESC>" "q"];
	};

	dap-virtual-text.enable = true;
      };

      signs = {
        dapBreakpoint = {
	  text = "";
	  texthl = "red";
	};

	dapBreakpointCondition = {
	  text = "";
	  texthl = "yellow";
	};

	dapBreakpointRejected = {
	  text = "";
	  texthl = "yellow";
	};

	dapLogPoint = {
	  text = "";
	  texthl = "blue";
	};

	dapStopped = {
	  text = "";
	  texthl = "green";
	};
      };
    };
  };

  keymaps =
  let
    mkKey = mode: key: action: desc: {
      mode = mode;
      key = key;
      action = action;

      options = {
        silent = true;
	desc = desc;
      };
    };

  in [
    (mkKey "n" "<leader>db" ":DapToggleBreakpoint<cr>" "Toggle Breakpoint")
    (mkKey "n" "<leader>dc" ":DapContinue<cr>" "Continue")
    (mkKey "n" "<leader>da" "<cmd>lua require('da').continue({ before = get_args })<cr>" "Run with args")
    (mkKey "n" "<leader>di" ":DapStepInto<cr>" "Step into")
    (mkKey "n" "<leader>do" ":DapStepOver<cr>" "Step over")
    (mkKey "n" "<leader>dO" ":DapStepOut<cr>" "Step out")
    (mkKey "n" "<leader>dp" "<cmd>lua require('dap').pause()<cr>" "Pause")
    (mkKey "n" "<leader>dt" ":DapTerminate<cr>" "Terminate")
    (mkKey "n" "<leader>du" "<cmd>lua require('dapui').toggle()<cr>" "Dap UI")
  ];

  extraConfigLua = ''
    require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
    require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
    require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
  '';

  extraPlugins = [ pkgs.vimPlugins.telescope-dap-nvim ];
}
