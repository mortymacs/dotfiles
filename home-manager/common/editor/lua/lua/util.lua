-- Set key map.
-- @param shortcut string: the shortcut keys.
-- @param command string: the command.
-- @param modes array{string}: supported modes. Defaults to all available modes.
-- @param is_expr bool: is it expression or not. Defaults to false.
function SetKeyMap(shortcut, command, modes, is_expr, desc)
  modes = modes or { "n", "i", "v", "x", "o", "c", "t", "l" }
  for _, v in pairs(modes) do
    pcall(vim.keymap.del, v, shortcut)
    desc = desc or tostring(command)
    local opts = { silent = true, noremap = v == "n", expr = is_expr or false, desc = desc }
    if v == "n" then
      vim.keymap.set(v, shortcut, command, opts)
    else
      vim.keymap.set(v, shortcut, command, opts)
    end
  end
end

-- Execute command and check the flag and exit it in the next request.
-- @param open_command string: the starter command.
-- @param close_command string: the exit command.
-- @param flag string: the attribute which should be set in global vim table.
function ToggleCommand(open_command, close_command, flag)
  if vim.g[flag] == true then
    vim.g[flag] = false
    vim.cmd(close_command)
  else
    vim.g[flag] = true
    vim.cmd(open_command)
  end
end

-- Restart LSP and all related plugins.
function RestartLsp()
  vim.cmd([[ LspRestart ]])
  require("symbol-usage").refresh()
end
