-- [[ Basic Autocommands ]]

-- set different indent / tab rules per filetype
vim.cmd([[ autocmd FileType python setlocal sts=4 sw=4 ]])

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight when yanking (copying) text",
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("goto-last-location-in-buffer", { clear = true }),
  command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif ]],
  desc = "Go to last loc when opening a buffer",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("do-not-auto-comment-new-line", { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
  desc = "Don't auto comment new line",
})

QuickCloseGroup = vim.api.nvim_create_augroup("quick-close-with-q", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = QuickCloseGroup,
  pattern = { "help", "startuptime", "qf", "fugitive", "null-ls-info", "dap-float" },
  command = [[ nnoremap <buffer><silent> q :close<CR>]],
  desc = "Windows to close with 'q'",
})

vim.api.nvim_create_autocmd("FileType", {
  group = QuickCloseGroup,
  pattern = { "man" },
  command = [[ nnoremap <buffer><silent> q :quit<CR> ]],
  desc = "Close 'man' with 'q'",
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("lazy").update({ show = false })
  end,
})
