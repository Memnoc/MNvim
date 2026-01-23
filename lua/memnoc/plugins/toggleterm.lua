return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				direction = "float",
				size = 15,
				persist_size = false,
				float_opts = {
					border = "rounded",
				},
				highlights = {
					FloatBorder = {
						guifg = "#ff9e64",
					},
				},
			})
		end,
		keys = {
			{
				"<Leader>9",
				desc = "Toggle Terminal",
				function()
					require("toggleterm").toggle(vim.v.count1)
				end,
			},
		},
		lazy = false,
	},
}
