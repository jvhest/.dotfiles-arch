return {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("github-theme").setup {
            options = {
                transparent = true,
            },
        }
        SetColorscheme "github_dark"
    end,
}

