return {
  "nvim-treesitter/nvim-treesitter",
  version = "v0.9.*",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "c",
        "rust",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

