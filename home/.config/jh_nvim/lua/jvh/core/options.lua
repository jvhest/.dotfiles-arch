vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- Show which line your cursor is on
opt.cursorline = true
-- One of 'line', 'screenline', 'number' or 'both' (=line + number)
opt.cursorlineopt = "both"
-- Show which column your cursor is on
opt.cursorcolumn = false

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 999 -- keep cursorline in middle of screen
-- Minimal number of screen columns either side of cursor if wrap is `false`
opt.sidescrolloff = 8

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.guicursor = "i:ver25-iCursor"

-- Highlight all matches on previous search pattern
opt.hlsearch = true

opt.shell = "/usr/bin/bash"
