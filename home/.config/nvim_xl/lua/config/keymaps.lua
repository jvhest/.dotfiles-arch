-- [[ Keymappings ]]

vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

vim.keymap.set("n", "<leader>ce", "<cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Source nvim config" })
vim.keymap.set("n", "<leader>cs", "<cmd>source ~/.config/nvim/init.lua<CR>", { desc = "Source nvim config" })

-- better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Dedent line" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent line" })

-- Resize window
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move up" })

-- navigate / center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page Down and Center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page Up and Center" })

-- search / center
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Selection and Center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev selection and Center" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- misc
vim.keymap.set("n", "0", "^", { desc = "Jump to first non-blank char" })
vim.keymap.set("n", "x", '"_x', { desc = "Delete Char" })
vim.keymap.set("n", "<S-q>", "@q", { desc = "Play Macro in q reg" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste Replace without Copy" })

-- [[ User Commands ]]

vim.api.nvim_create_user_command(
  "SudoWrite",
  "write !sudo -A tee % >/dev/null",
  { bang = true, desc = "Write file as sudo user" }
)
