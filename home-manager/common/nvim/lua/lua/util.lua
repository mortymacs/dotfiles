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

-- Restart LSP and all related plugins.
function RestartLsp()
  vim.cmd([[ LspRestart ]])
  require("symbol-usage").refresh()
end

-- AddToQuickFix add item to the quickfix.
-- @param bufnr int: buffer number.
-- @param ns int: namespace.
-- @param lnum int: line number.
-- @param end_lnum: end line number.
-- @param col int: start column number.
-- @param end_col: end column number.
-- @param message string: message body.
-- @param message_type string: message type ('E' or 'W')
-- @param user_data table: user data (e.g. LSP, and etc)
function AddToQuickFix(bufnr, ns, lnum, end_lnum, col, end_col, message, message_type, user_data)
  local current_quickfix_list = vim.api.nvim_call_function("getqflist", {})

  -- Make the new quickfix item.
  local new_item = {
    bufnr = bufnr,
    id = ns,
    lnum = lnum,
    end_lnum = end_lnum,
    col = col,
    end_col = end_col,
    text = message,
    type = message_type,
    user_data = user_data,
  }
  table.insert(current_quickfix_list, new_item)

  -- Set the quickfix list.
  vim.api.nvim_call_function("setqflist", { current_quickfix_list })
end

-- CleanupQuickFix cleans current buffer items from the quickfix.
-- @param bufnr int: buffer number.
function CleanupQuickFix(bufnr)
  local current_quickfix_list = vim.fn.getqflist()

  -- Remove current buffer items to avoid duplications.
  for i = #current_quickfix_list, 1, -1 do
    local item = current_quickfix_list[i]
    if item.bufnr == bufnr then
      table.remove(current_quickfix_list, i)
    end
  end

  -- Set the quickfix list.
  vim.api.nvim_call_function("setqflist", { current_quickfix_list })
end

-- SeverityToMessageType converts diagnostics severity number to message type.
function SeverityToMessageType(severity)
  local errors = {
    "E",
    "W",
    "I",
    "H",
  }
  return errors[severity]
end

-- DiagnosticsToQuickFix inserts all diagnostics records into quickfix.
-- @param bufnr int: buffer number.
function DiagnosticsToQuickFix(bufnr, ns)
  -- Create namespace.
  local namespaces = vim.api.nvim_get_namespaces()
  if namespaces and namespaces[ns] == nil then
    vim.api.nvim_create_namespace(ns)
  end

  CleanupQuickFix(bufnr)

  -- Find diagnostics and insert them.
  local diagnostics = vim.diagnostic.get(bufnr)
  for _, diagnostic in pairs(diagnostics) do
    AddToQuickFix(
      diagnostic.bufnr,
      ns,
      diagnostic.lnum + 1,
      diagnostic.end_lnum + 1,
      diagnostic.col,
      diagnostic.end_col,
      diagnostic.message,
      diagnostic.severity,
      diagnostic.user_data
    )
  end
end
