-- "catppuccin",
-- "github_dark",

local my_colorscheme = "catppuccin"
local set_colorscheme = function(colorscheme)
    if colorscheme == my_colorscheme then
        vim.cmd.colorscheme(my_colorscheme)
    end
end

return {

    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup {
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
                transparent_background = true,
            }
            set_colorscheme "catppuccin"
        end,
    },

    {
        "projekt0n/github-nvim-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("github-theme").setup {
                options = {
                    transparent = true,
                },
            }
            set_colorscheme "github_dark"
        end,
    },

}
