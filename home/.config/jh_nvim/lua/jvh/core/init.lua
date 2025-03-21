-- set transparency
vim.api.nvim_set_hl(0, "Normal", { ctermbg = NONE, guibg = NONE })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = NONE, guibg = NONE })

require("jvh.core.options")
require("jvh.core.keymaps")
