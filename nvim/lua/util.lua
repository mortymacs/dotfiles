function SetKeyMap(shortcut, command, modes)
	modes = modes or {"n", "i", "v", "x", "o", "c", "t", "l"}
	for k, v in pairs(modes) do
        pcall(vim.keymap.del, v, shortcut)
        if v == "n" then
            vim.keymap.set(v, shortcut, command, {silent = true, noremap = true})
        else
            vim.keymap.set(v, shortcut, command, {silent = true, noremap = false})
        end
	end
end
