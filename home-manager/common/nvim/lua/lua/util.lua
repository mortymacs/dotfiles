function SetKeyMap(shortcut, command, modes, is_expr)
	modes = modes or {"n", "i", "v", "x", "o", "c", "t", "l"}
	for k, v in pairs(modes) do
        pcall(vim.keymap.del, v, shortcut)
        local opts = {silent = true, noremap = v == "n", expr = is_expr or false}
        if v == "n" then
            vim.keymap.set(v, shortcut, command, opts)
        else
            vim.keymap.set(v, shortcut, command, opts)
        end
	end
end

function RunAndRevertCursor(command)
    local old_location = vim.api.nvim_win_get_cursor(0)
    vim.cmd(command)
    vim.api.nvim_win_set_cursor(0, old_location)
end
