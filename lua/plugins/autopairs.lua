-- autopairs

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				rust = { "string" },
				python = { "string" },
				cpp = { "string" },
				c = { "string" },
			},
			disable_filetype = { "TelescopePrompt", "vim" },
		})
		-- nvim-cmp integration
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
