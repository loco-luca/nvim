return {
	"mfussenegger/nvim-dap",
	priority = 1000,
	lazy = false,
	name = "nvim-dap",
	config = function()
		local dap = require("dap")

		-- ====================================
		-- C++ / C (lldb)
		-- ====================================
		dap.adapters.lldb = {
			type = "executable",
			command = vim.fn.expand("~/.opt/llvm/bin/lldb-dap"),
			name = "lldb",
		}
		dap.configurations.cpp = {
			{
				name = "Launch C++",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
		dap.configurations.c = dap.configurations.cpp

		-- ====================================
		-- Python (debugpy)
		-- ====================================
		dap.adapters.python = {
			type = "executable",
			command = "python3",
			args = { "-m", "debugpy.adapter" },
		}
		dap.configurations.python = {
			{
				name = "Launch Python file",
				type = "python",
				request = "launch",
				program = "${file}",
				console = "integratedTerminal",
			},
		}

		-- ====================================
		-- Dart (dart debug adapter) - Only if dart is available
		-- ====================================
		if vim.fn.executable("dart") == 1 then
			dap.adapters.dart = {
				type = "executable",
				command = "dart",
				args = { "debug_adapter" },
			}
			dap.configurations.dart = {
				{
					name = "Launch Dart",
					type = "dart",
					request = "launch",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}
		end

		-- ====================================
		-- Rust (via lldb)
		-- ====================================
		dap.configurations.rust = {
			{
				name = "Launch Rust",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}

		-- ====================================
		-- Lua (local Neovim instance debug)
		-- ====================================
		dap.adapters.nlua = function(callback, config)
			callback({ type = "server", host = config.host, port = config.port })
		end
		dap.configurations.lua = {
			{
				type = "nlua",
				request = "attach",
				name = "Attach to running Neovim instance",
				host = function()
					return "127.0.0.1"
				end,
				port = function()
					return tonumber(vim.fn.input("Port: ", "8086"))
				end,
			},
		}

		-- ====================================
		-- Keymaps for DAP
		-- ====================================
		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end, { desc = "DAP Continue" })
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end, { desc = "DAP Step Over" })
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end, { desc = "DAP Step Into" })
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end, { desc = "DAP Step Out" })
		vim.keymap.set("n", "<C-b>", function()
			dap.toggle_breakpoint()
		end, { desc = "DAP Toggle Breakpoint" })
		vim.keymap.set("n", "<Leader>pp", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "DAP Conditional Breakpoint" })
	end,
}
