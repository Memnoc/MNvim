return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				on_highlights = function(hl, c)
					-- NvimTree (just in case)
					-- hl.NvimTreeGitNew = { fg = "#ff9e64" }
					-- hl.NvimTreeGitDirty = { fg = "#ff9e64" }
					-- hl.NvimTreeGitStaged = { fg = "#9ece6a" }
					-- hl.NvimTreeGitRenamed = { fg = "#7aa2f7" }
					-- hl.NvimTreeGitDeleted = { fg = "#f7768e" }

					-- NeoTree
					hl.NeoTreeGitModified = { fg = "#ff9e64" }
					hl.NeoTreeGitUntracked = { fg = "#ff9e64" }
					hl.NeoTreeGitAdded = { fg = "#9ece6a" }
					hl.NeoTreeGitDeleted = { fg = "#f7768e" }
					hl.NeoTreeGitRenamed = { fg = "#7aa2f7" }
					hl.NeoTreeGitStaged = { fg = "#9ece6a" }
				end,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
