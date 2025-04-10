-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.cmd [[ autocmd FileType toml setlocal ts=2 sts=2 sw=2 expandtab indentexpr= ]]
vim.cmd [[ autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentexpr= ]]
vim.cmd [[ autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab indentexpr= ]]
vim.cmd [[ autocmd FileType python setlocal foldmethod=indent ]]
vim.cmd [[ autocmd TermOpen * setlocal statusline=%{b:term_title} ]]
vim.cmd [[ autocmd TermOpen * startinsert ]] -- start terminal in insert-mode
-- Per default, netrw leaves unmodified buffers open.  This autocommand
-- deletes netrw's buffer once it's hidden (using ':q;, for example)
vim.cmd [[autocmd FileType netrw setlocal bufhidden=delete]]

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Go to last loc when opening a buffer",
    group = vim.api.nvim_create_augroup("goto-last-location-in-buffer", { clear = true }),
    command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif ]],
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Don't auto comment new line",
    group = vim.api.nvim_create_augroup("do-not-auto-comment-new-line", { clear = true }),
    command = [[ set formatoptions-=cro ]],
})

QuickCloseGroup = vim.api.nvim_create_augroup("quick-close-with-q", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    desc = "Windows to close with 'q'",
    group = QuickCloseGroup,
    pattern = { "help", "startuptime", "qf", "fugitive", "null-ls-info", "dap-float" },
    command = [[ nnoremap <buffer><silent> q :close<CR>]],
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "Close 'man' with 'q'",
    group = QuickCloseGroup,
    pattern = { "man" },
    command = [[ nnoremap <buffer><silent> q :quit<CR> ]],
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "Close 'netrw' with 'q'",
    group = QuickCloseGroup,
    pattern = { "netrw" },
    command = [[ nnoremap <buffer><silent> q :bd<CR> ]],
})
