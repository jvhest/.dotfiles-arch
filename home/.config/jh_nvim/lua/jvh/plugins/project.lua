return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup {
      active = true,
      on_config_done = nil,
      manual_mode = false,
      detection_methods = { "pattern" },
      patterns = {
        ".git",
        "_darcs",
        "Makefile",
        "package.json",
        "pyproject.toml",
        ">workspace",
      },
      ignore_lsp = {},
      exclude_dirs = {},
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = "global",
      datapath = vim.fn.stdpath "data",
    }
  end
}
