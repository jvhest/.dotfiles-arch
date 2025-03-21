local M = {}

local vim_modes = {
    n = "n",
    i = "i",
    v = "v",
}

local default_opts = {
    noremap = true,
    silent = true,
}

M.keymap = function(mode, lhs, rhs, options)
    -- TODO check for valid mode in argument (local mode = vim_modes[vimmode] or "n")
    local opts = options or {}
    for k, v in pairs(default_opts) do
        opts[k] = opts[k] or v
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

M.keymap_buf = function(mode, lhs, rhs, bufnr, options)
    -- TODO check for valid mode in argument (local mode = vim_modes[vimmode] or "n")
    local opts = options or {}
    for k, v in pairs(default_opts) do
        opts[k] = opts[k] or v
    end
    opts.buffer = bufnr
    vim.keymap.set(mode, lhs, rhs, opts)
end

M.open_terminal = function(size, position)
    position = vim.F.if_nil(position, "n")
    if position == "v" then
        vim.cmd(string.format("%dvnew", size))
    else
        vim.cmd(string.format("%dnew", size))
    end
    vim.cmd [[ term ]]
end

--- Telescope Wrapper around vim.notify
---@param title string: name of the function that will be
---@param opts table: opts.level string, opts.msg string, opts.once bool
M.notify = function(title, opts)
    opts.once = vim.F.if_nil(opts.once, false)
    local level = vim.log.levels[opts.level]
    if not level then
        error("Invalid error level", 2)
    end
    local notify_fn = opts.once and vim.notify_once or vim.notify
    notify_fn(string.format("[%s]: %s", title, opts.msg), level, {})
end

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
M.find_git_root = function()
    -- Use the current buffer's path as the starting point for the git search
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    -- If the buffer is not associated with a file, return nil
    if current_file == "" then
        current_dir = cwd
    else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ":h")
    end

    -- Find the Git root directory from the current file's path
    local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
        print "Not a git repository. Searching on current working directory"
        return cwd
    end
    return git_root
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle_option(option, silent, values)
    -- on / off values
    if values then
        if vim.opt_local[option]:get() == values[1] then
            vim.opt_local[option] = values[2]
        else
            vim.opt_local[option] = values[1]
        end
        vim.notify("INFO: Set " .. option .. " to " .. vim.opt_local[option]:get())
        return
    end
    -- else true / false
    vim.opt_local[option] = not vim.opt_local[option]:get()
    if not silent then
        if vim.opt_local[option]:get() then
            vim.notify("INFO: Enabled " .. option)
        else
            vim.notify("INFO: Disabled " .. option)
        end
    end
end

local diag_enabled = true
function M.toggle_diagnostics()
    diag_enabled = not diag_enabled
    if diag_enabled then
        vim.diagnostic.enable()
        vim.notify "INFO: Enabled diagnostics"
    else
        vim.diagnostic.disable()
        vim.notify "INFO: Disabled diagnostics"
    end
end

function M.toggle_line_numbers()
    local num = vim.opt.number:get()
    if num then
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.notify "INFO: Disabled line numbers"
    else
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.notify "INFO: Enabled line numbers"
    end
end

return M
