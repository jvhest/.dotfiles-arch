return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "cmake",
        "lua",
        "python",
        "go",
        "bash",
        "beancount",
        "query",
        "rust",
        "javascript",
        "html",
        "markdown",
        "markdown_inline",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true, additional_vim_regex_highlighting = false },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "C-<Enter>", -- set to `false` to disable one of the mappings
          node_incremental = "C-<Enter>",
          scope_incremental = false,
          node_decremental = "C-<Backspace>",
        },
      },
    })
    vim.treesitter.language.register("markdown", "vimwiki")
  end,
}
