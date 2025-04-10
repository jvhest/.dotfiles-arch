
-- [[ Vim Globals ]]
vim.g.mapleader = ' '                    -- set <space> as leader key
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- netrw
vim.g.netrw_banner = 0               -- gets rid of the annoying banner for netrw
vim.g.netrw_winsize = 30
vim.g.netrw_browse_split=4           -- open in prior window
vim.g.netrw_altv = 1                 -- change from left splitting to right splitting
vim.g.netrw_liststyle=3              -- tree style view in netrw

-- [[ Vim-settings ]]

vim.opt.title = true                     -- show title
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false               -- turn off vi compatibility mode
vim.opt.number = true                    -- turn on line numbers
vim.opt.relativenumber = true            -- turn on relative line numbers
vim.opt.mouse = 'a'                      -- enable the mouse in all modes
vim.opt.ignorecase = true                -- enable case insensitive searching
vim.opt.smartcase = true                 -- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = true                  -- disable all highlighted search results
vim.opt.incsearch = true                 -- enable incremental searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true                      -- enable text wrapping
vim.opt.tabstop = 4                      -- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.fileencoding = 'utf-8'           -- encoding set to utf-8
vim.opt.pumheight = 10                   -- number of items in popup menu
vim.opt.showtabline = 2                  -- always show the tab line
vim.opt.laststatus = 2                   -- always show statusline
vim.opt.signcolumn = 'yes'
vim.opt.expandtab = true                 -- expand tab
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.showmode = true
vim.opt.scrolloff = 8                    -- scroll page when cursor is 8 lines from top/bottom
vim.opt.backspace = 'indent,eol,start'   -- allow backspace on indent, end of line or insert mode start position
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'
vim.opt.sidescrolloff = 8                -- scroll page when cursor is 8 spaces from left/right
vim.opt.scrolloff = 5   -- 999                  -- keep cursorline in middle of screen
vim.opt.guifont = 'monospace:h17'
-- vim.opt.clipboard = unnamedplus
vim.opt.clipboard:append('unnamedplus')
vim.opt.completeopt= { 'menuone', 'noselect' }
vim.opt.splitbelow = true                -- split go below
vim.opt.splitright = true                -- vertical split to the right
vim.opt.termguicolors = true             -- terminal gui colors
vim.opt.list = true                      -- display certain whitespace in the editor
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'

vim.o.statusline = "  %l    %Y        %F    %m %=    buffer:%n       %p%%      "

-- [[ Basic Keymaps ]]

-- open/close netrw
vim.keymap.set("n", "<f12>", "<cmd>20Lexplore<CR>")                -- Open netrw in 20% split in tree view

-- edit/reload nvim config"
vim.keymap.set('n', '<leader>ce', '<cmd>e! ~/.config/nvim<CR>')
vim.keymap.set('n', '<leader>cr', '<cmd>source ~/.config/nvim/init.lua<CR>')

-- easy splits
vim.keymap.set('n', '<leader>wv', '<C-w><C-v>', { desc = 'Split [V]ertically' })
vim.keymap.set('n', '<leader>ws', '<C-w><C-s>', { desc = 'Split [H]orizontally' })
vim.keymap.set('n', '<leader>wc', '<C-w><C-c>', { desc = '[C]lose current window' })
vim.keymap.set('n', '<leader>wo', '<C-w><C-o>', { desc = 'Close [O]ther windows' })

-- easy split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffer navigation
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>')                     -- Next buffer
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>')               -- Previous buffer
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>')                  -- New file buffer
vim.keymap.set('n', '<leader>bc', '<cmd>bdelete!<CR>')             -- Close current buffer
vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd<CR>')             -- Close all buffers

-- adjust split sizes easier
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize +3<CR>')     -- Resizes vertical split +
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize -3<CR>')    -- Resizes vertical split -
vim.keymap.set('n', '<C-Up>', '<cmd>resize +3<CR>')                -- Resize horizontal split +
vim.keymap.set('n', '<C-Down>', '<cmd>resize -3<CR>')              -- Resize horizontal split -

-- back to normal mode
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')

-- move lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<CR>==')                   -- Move current line down
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<CR>==')                   -- Move current line up
vim.keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv")               -- Move current line down
vim.keymap.set("v", "<A-k>", "<cmd>m '>-2<CR>gv=gv")               -- Move current line up

-- better indenting
vim.keymap.set('v', '<', '<gv')                                    -- Move line(s) to left
vim.keymap.set('v', '>', '>gv')                                    -- Move line(s) to right

-- other keys
vim.keymap.set('n', '<C-s>', '<cmd>w<CR><esc>')                    -- Save file
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')                -- Clear search highlights
vim.keymap.set('n', '0', '^')                                      -- Jump to first non-blank char
vim.keymap.set('n', 'x', '"_x')                                    -- Delete char without yank
vim.keymap.set('n', 'Q', '@q')                                     -- Play Macro in q reg (qq -> Q)
vim.keymap.set('v', 'p', '"_dP')                                   -- Paste Replace without Copy

-- autopairs
vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("i", "\"", "\"\"<left>")
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "`", "``<left>")

-- [[ User Commands ]]

vim.api.nvim_create_user_command('SudoWrite',
    "write !sudo -A tee % >/dev/null",
    {bang = true, desc = "Write file as sudo user"}
)

-- [[ Basic Autocommands ]]

-- trim trailing spaces on save
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Trim trailing spaces on save',
  group = vim.api.nvim_create_augroup('my-trim-spaces', { clear = true }),
  command = [[%s/\s\+$//e]],
})

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('my-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
  end,
})

vim.cmd [[
    set path+=**
    colorscheme catppuccin
    highlight Normal ctermbg=NONE guibg=NONE
    filetype plugin on
    set wildmenu
]]

-- [[ Install lazy.nvim plugin manager ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]

require("lazy").setup({
   -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false }
  },
  { -- Change to a different colorscheme.
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
      -- Load the colorscheme here:
      -- such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-moon'
    end,
  },
  { import = "plugins" },
},
{
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
})

