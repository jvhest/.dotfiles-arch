-- set colorscheme
SetColorscheme = function(colorscheme)
  if colorscheme == MyColorscheme then
    vim.cmd.colorscheme(MyColorscheme)
  end
end
MyColorscheme = "catppuccin" -- "catppuccin" | "tokyonight" | "github_dark" | "kanagawa"

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Show which line your cursor is on
vim.opt.cursorline = true
-- One of 'line', 'screenline', 'number' or 'both' (=line + number)
vim.opt.cursorlineopt = "both"
-- Show which column your cursor is on
vim.opt.cursorcolumn = false

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- tabs & indentation
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.shiftwidth = 2 -- spaces for indent width
vim.opt.softtabstop = 2 -- spaces for tabs (prettier default)
-- vim.opt.tabstop = 4 -- default = 8

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.undofile = true -- save undo-info between sessions

-- turn off swapfile
vim.opt.swapfile = false

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.wrap = false
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10 -- keep cursorline in middle of screen
-- Minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.sidescrolloff = 8

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.guicursor = "i:ver25-iCursor"

-- Highlight all matches on previous search pattern
vim.opt.hlsearch = true

-- no auto comment on new line
vim.opt.formatoptions:remove({ "r", "o" })

vim.opt.shell = "/usr/bin/bash"

-- [[ Vim Commands ]]

vim.cmd([[
  set path+=**
  set nocompatible
  filetype plugin on
  syntax on
]])
