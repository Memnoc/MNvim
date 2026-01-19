return {
  {
    "stevearc/dressing.nvim",
    dependencies = {
      "ziontee113/icon-picker.nvim",
      keys = {
        { "<Leader>i", "<cmd>IconPickerNormal<cr>", desc = "Icon picker" },
        { "<Leader>y", "<cmd>IconPickerYank<cr>", desc = "Icon picker yank" },
        { "<C-i>", "<cmd>IconPickerInsert<cr>", mode = "i", desc = "Icon picker insert" },
      },
      config = function()
        require("icon-picker").setup({
          disable_legacy_commands = true,
        })
      end,
    },
  },
}
