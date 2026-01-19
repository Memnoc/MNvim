return {
	"nvim-treesitter/nvim-treesitter",
	-- TODO: update when other plugins catch up
	-- main = "nvim-treesitter.configs",
	-- WARN: pinned to frozen master for now
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "vim", "vimdoc", "c", "rust", "javascript", "typescript", "tsx", "html", "css" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
