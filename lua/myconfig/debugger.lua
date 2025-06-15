-- Debugger Plugins Setup for macOS (LLDB + Python)
return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Keybindings
      vim.keymap.set('n', '<F5>', dap.continue)
      vim.keymap.set('n', '<F10>', dap.step_over)
      vim.keymap.set('n', '<F11>', dap.step_into)
      vim.keymap.set('n', '<F12>', dap.step_out)
      vim.keymap.set('n', '<Leader>bp', dap.toggle_breakpoint)
      vim.keymap.set('n', '<Leader>BP', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end)
      vim.keymap.set('n', '<Leader>lp', function()
        dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
      end)
      vim.keymap.set('n', '<Leader>dr', dap.repl.open)
      vim.keymap.set('n', '<Leader>dl', dap.run_last)

      -- LLDB Adapter for macOS (via Xcode)
      dap.adapters.lldb = {
        type = 'executable',
        command = '/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/Resources/lldb-vscode',
        name = "lldb"
      }

      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dapui = require("dapui")
      local dap = require("dap")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-python").setup("/opt/homebrew/bin/python3")
    end,
  },
}

