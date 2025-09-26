return {
	{
		"folke/zen-mode.nvim",
		dependencies = {
			"folke/twilight.nvim",
		},
		opts = {
			plugins = {
				twilight = { enabled = true }, -- 🔑 this enables Twilight automatically
			},
		},
	},
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 1, -- how much to dim (0 = no dim, 1 = completely dim)
				color = { "Normal", "#000000" }, -- dimming color
			},
			context = 0, -- number of lines around cursor to keep visible
		},
	},
}
