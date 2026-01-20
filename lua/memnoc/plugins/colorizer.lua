return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "background", -- or "foreground", "virtual"
			enable_named_colors = true,
		})
	end,
}
