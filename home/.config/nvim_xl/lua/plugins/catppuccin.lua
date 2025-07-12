return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    build = ":CatppuccinCompile",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup {
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            transparent_background = true,
            integrations = { treesitter = true, },
            compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
        }

        SetColorscheme "catppuccin"
    end,
}

