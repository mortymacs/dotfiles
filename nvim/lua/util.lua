function SetKeyMap(shortcut, command, modes)
	modes = modes or {"n", "i", "v"}
	for k, v in pairs(modes) do
        pcall(vim.keymap.del, v, shortcut)
        vim.keymap.set(v, shortcut, command, {noremap = true, silent = true})
	end
end
