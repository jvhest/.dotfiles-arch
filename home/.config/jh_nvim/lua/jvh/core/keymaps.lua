local utils = require("jvh.core.utils")

vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- window management
keymap.set("n", "<leader>wh", "<C-w>v", { desc = "Split window right" }) -- split window vertically
keymap.set("n", "<leader>wv", "<C-w>s", { desc = "Split window below" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<C-w>c", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>wo", "<C-W>o", { desc = "Close other windows" })
keymap.set("n", "<leader>wp", "<C-W>p", { desc = "Goto other window" })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

--  See `:help wincmd` for a list of all window commands
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to the upper window" })

-- Edit neovim config
vim.keymap.set("n", "<leader>ce", "<cmd>e! ~/.config/nvim<CR>", { desc = "Edit nvim config" })
vim.keymap.set("n", "<leader>cs", "<cmd>source ~/.config/nvim/init.lua<CR>", { desc = "Source nvim config" })

-- better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Dedent line" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent line" })

-- Better up/down
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move up" })
keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { desc = "Move down" })
keymap.set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { desc = "Move up" })

-- Buffers
keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bx", "<cmd>bdelete!<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>bX", "<cmd>bufdo bd<CR>", { desc = "Close all buffers" })
keymap.set("n", "<leader>bc", "<cmd>cd %:p:h<CR><cmd>pwd<CR>", { desc = "Switch CWD to curr buffer dir" })

-- tab management
keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>", { desc = "Create new tab" }) -- open new tab
keymap.set("n", "<leader>te", '<cmd>tabedit <C-r>=escape(expand("%:p:h"), " ")<CR>',
  { desc = "New tab with curr buffers path" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Close other tabs" })
keymap.set("n", "<leader>tm", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "]t", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "[t", "<cmd>tabprev<CR>", { desc = "Prev tab" })

-- save file
keymap.set({ "n", "v", "i", "s" }, "<C-s>", "<cmd>w<CR><esc>", { desc = "Save file" })

-- searching
keymap.set({ "n", "i" }, "gw", "*N", { desc = "Search word under cursor" })
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap.set({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

keymap.set("n", "0", "^", { desc = "Jump to first non-blank char" })
keymap.set("n", "x", '"_x', { desc = "Delete Char" })
keymap.set("n", "<S-q>", "@q", { desc = "Play Macro in q reg" })
keymap.set("v", "p", '"_dP', { desc = "Paste Replace without Copy" })
keymap.set("i", ";;", "<Esc>A;<Esc>i", { desc = "Insert Trailing ;" })
keymap.set("i", ",,", "<Esc>A,<Esc>i", { desc = "Insert Trailing ," })

-- new file
keymap.set("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New File" })

keymap.set("n", "<leader>xl", "<cmd>lopen<CR>", { desc = "Location List" })
keymap.set("n", "<leader>xq", "<cmd>copen<CR>", { desc = "Quickfix List" })

-- used with Trouble plugin
keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Previous quickfix" })
keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix" })

-- quit
keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })
keymap.set("n", "<leader>qf", "<cmd>qa!<CR>", { desc = "Quit all forced!" })

-- fixed terminal
keymap.set("n", "<leader>T", function()
    utils.open_terminal(10)
end, { desc = "Open terminal" })
keymap.set("t", "<Esc>", "<C-\\><C-N><C-w>c", { desc = "Close terminal" })
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Nav Left from Terminal" })
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Nav Down from Terminal" })
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Nav Up from Terminal" })
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Nav Right from Terminal" })

-- navigate / center
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page Down and Center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page Up and Center" })
keymap.set("n", "n", "nzzzv", { desc = "Next Selection and Center" })
keymap.set("n", "N", "Nzzzv", { desc = "Prev selection and Center" })

-- toggle options
keymap.set("n", "<leader>ul", function()
    utils.toggle_line_numbers()
end, { desc = "Toggle Line numbers" })
keymap.set("n", "<leader>ud", function()
    utils.toggle_diagnostics()
end, { desc = "Toggle Diagnostics" })
keymap.set("n", "<leader>us", function()
    utils.toggle_option "spell"
end, { desc = "Toggle Spelling" })
keymap.set("n", "<leader>uw", function()
    utils.toggle_option "wrap"
end, { desc = "Toggle Word Wrap" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
keymap.set("n", "<leader>uc", function()
    utils.toggle_option("conceallevel", false, { 0, conceallevel })
end, { desc = "Toggle Conceal" })

