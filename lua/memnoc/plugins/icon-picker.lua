return {
	"ziontee113/icon-picker.nvim",
	dependencies = { "stevearc/dressing.nvim" },
	keys = {
		{ "<leader>ip", "<cmd>IconPickerNormal<cr>", desc = "Pick icon" },
		{ "<leader>iy", "<cmd>IconPickerYank<cr>", desc = "Yank icon" },
		{ "<C-i>", "<cmd>IconPickerInsert<cr>", mode = "i", desc = "Insert icon" },
	},
	config = function()
		require("icon-picker").setup({
			disable_legacy_commands = true,
		})
	end,
}
