-- Set key map.
-- @param shortcut string: the shortcut keys.
-- @param command string: the command.
-- @param modes array{string}: supported modes. Defaults to all available modes.
-- @param is_expr bool: is it expression or not. Defaults to false.
function SetKeyMap(shortcut, command, modes, is_expr)
  modes = modes or { "n", "i", "v", "x", "o", "c", "t", "l" }
  for k, v in pairs(modes) do
    pcall(vim.keymap.del, v, shortcut)
    local opts = { silent = true, noremap = v == "n", expr = is_expr or false }
    if v == "n" then
      vim.keymap.set(v, shortcut, command, opts)
    else
      vim.keymap.set(v, shortcut, command, opts)
    end
  end
end

-- Run a command and move the cursor back to the previous location.
-- @param command string.
function RunAndRevertCursor(command)
  local old_location = vim.api.nvim_win_get_cursor(0)
  vim.cmd(command)
  pcall(vim.api.nvim_win_set_cursor, 0, old_location)
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

-- Return top padding based on the current window height.
function CalcTopPadding(maxPadding)
  if vim.api.nvim_win_get_height(0) < 20 then
    return 1
  end
  return maxPadding or 10
end
