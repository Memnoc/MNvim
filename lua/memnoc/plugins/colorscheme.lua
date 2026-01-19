return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				-- on_highlights = function(hl, c)
				--    hl.NvimTreeGitNew = { fg = "#ff9e64" }
				--    hl.NvimTreeGitDirty = { fg = "#ff9e64" }
				--    hl.NvimTreeGitStaged = { fg = "#9ece6a" }
				--    hl.NvimTreeGitRenamed = { fg = "#7aa2f7" }
				--    hl.NvimTreeGitDeleted = { fg = "#f7768e" }
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
