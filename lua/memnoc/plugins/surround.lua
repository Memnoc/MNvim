return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	opts = {
		keymaps = {
			insert = "<C-g>s",
			insert_line = "<C-g>S",
			normal = "ys",
			normal_cur = "yss",
			normal_line = "yS",
			normal_cur_line = "ySS",
			visual = "S",
			visual_line = "gS",
			delete = "ds",
			change = "cs",
			change_line = "cS",
		},
	},
	-- Usage:
	-- ys{motion}{char} - add surround (e.g., ysiw" to surround word with ")
	-- ds{char}         - delete surround (e.g., ds" to delete surrounding ")
	-- cs{old}{new}     - change surround (e.g., cs"' to change " to ')
	-- yss{char}        - surround entire line
	-- S{char}          - surround selection (visual mode)
}
