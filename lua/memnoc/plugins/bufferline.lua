return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Pin buffer" },
		{ "<leader>bx", "<cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
		{ "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete buffer" },
	},
	opts = {
		options = {
			mode = "buffers",
			themable = true,
			numbers = "none",
			close_command = "bdelete! %d",
			indicator = {
				icon = "▎",
				style = "icon",
			},
			buffer_close_icon = "󰅖",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diag)
				local icons = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
				local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
				return vim.trim(ret)
			end,
			offsets = {
				{
					filetype = "snacks_layout_box",
					text = "Explorer",
					highlight = "Directory",
					text_align = "center",
				},
			},
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = false,
			show_tab_indicators = true,
			separator_style = "thin",
			always_show_bufferline = true,
			sort_by = "insert_at_end",
		},
		highlights = {
			indicator_selected = {
				fg = "#7aa2f7",
			},
			buffer_selected = {
				bold = true,
				italic = false,
			},
		},
	},
}
