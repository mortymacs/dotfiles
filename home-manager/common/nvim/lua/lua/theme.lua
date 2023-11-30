vim.g.background = "dark"
vim.g.ayucolor = "dark"
vim.cmd.colorscheme("ayu")

-- Body
vim.api.nvim_set_hl(0, "Normal",      {bg = ""})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#1A1B24"})
vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = "", fg = "#090d12"})
vim.api.nvim_set_hl(0, "LineNr",      {bg = "", fg = "#292948"})
vim.api.nvim_set_hl(0, "SignColumn",  {bg = ""})
vim.api.nvim_set_hl(0, "VertSplit",   {bg = "", fg = "#1b1c36"})
vim.api.nvim_set_hl(0, "NonText",     {bg = "", fg = ""})

-- Statusline
vim.api.nvim_set_hl(0, "StatusLine",     {bg = "", fg = ""})
vim.api.nvim_set_hl(0, "StatusLineTerm", {bg = "", fg = ""})

-- Splashscreen
vim.api.nvim_set_hl(0, "AlphaHeader", {bg = "", fg = "#17c3b2"})

-- Cmd
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", {bg = "", fg = "#686f9a"})
vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",              {bg = "", fg = ""})

-- Git
vim.api.nvim_set_hl(0, "GitSignsAdd",    {bg = "", fg = "#5ccc96"})
vim.api.nvim_set_hl(0, "GitSignsChange", {bg = "", fg = "#e39400"})
vim.api.nvim_set_hl(0, "GitSignsDelete", {bg = "", fg = "#ce6f8f"})

-- Notification
vim.api.nvim_set_hl(0, "NotifyDEBUGBody",  {bg = "#090d12"})
vim.api.nvim_set_hl(0, "NotifyINFOBody",   {bg = "#090d12"})
vim.api.nvim_set_hl(0, "NotifyWARNBody",   {bg = "#090d12"})
vim.api.nvim_set_hl(0, "NotifyERRORBody",  {bg = "#090d12"})
vim.api.nvim_set_hl(0, "NotifyTRACEBody",  {bg = "#090d12"})
vim.api.nvim_set_hl(0, "NotifyBackground", {bg = "#090d12"})

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal",        {bg = "#090d12"})
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {bg = "#090d12"})
vim.api.nvim_set_hl(0, "TelescopePromptNormal",  {bg = "#090d12"})
vim.api.nvim_set_hl(0, "TelescopeResultNormal",  {bg = "#090d12"})
vim.api.nvim_set_hl(0, "TelescopeBorder",        {bg = "#090d12", fg = "#686f9a"})

-- Development
vim.api.nvim_set_hl(0, "FidgetTitle", {bg = "#090d12"})
vim.api.nvim_set_hl(0, "FidgetTask",  {bg = "#090d12"})

-- LSP
-- -- General.
vim.api.nvim_set_hl(0, "Pmenu",                    {fg = "#ecf0c1", bg = "#1A1B24"})
vim.api.nvim_set_hl(0, "PmenuSbar",                {bg = "#272831"})
-- -- CMP.
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated",    {fg = "#7E8294"})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch",         {fg = "#82AAFF"})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy",    {fg = "#82AAFF"})
vim.api.nvim_set_hl(0, "CmpItemMenu",              {fg = "#C792EA"})
vim.api.nvim_set_hl(0, "CmpItemKindField",         {fg = "#00B9AE"})
vim.api.nvim_set_hl(0, "CmpItemKindProperty",      {fg = "#00B9AE"})
vim.api.nvim_set_hl(0, "CmpItemKindEvent",         {fg = "#00B9AE"})
vim.api.nvim_set_hl(0, "CmpItemKindText",          {fg = "#FFCF9C"})
vim.api.nvim_set_hl(0, "CmpItemKindEnum",          {fg = "#7a5ccc"})
vim.api.nvim_set_hl(0, "CmpItemKindKeyword",       {fg = "#5ccc96"})
vim.api.nvim_set_hl(0, "CmpItemKindConstant",      {fg = "#FFE082"})
vim.api.nvim_set_hl(0, "CmpItemKindConstructor",   {fg = "#FFE082"})
vim.api.nvim_set_hl(0, "CmpItemKindReference",     {fg = "#FFE082"})
vim.api.nvim_set_hl(0, "CmpItemKindFunction",      {fg = "#eb5e28"})
vim.api.nvim_set_hl(0, "CmpItemKindStruct",        {fg = "#EB5E55"})
vim.api.nvim_set_hl(0, "CmpItemKindClass",         {fg = "#EB5E55"})
vim.api.nvim_set_hl(0, "CmpItemKindModule",        {fg = "#EB5E55"})
vim.api.nvim_set_hl(0, "CmpItemKindOperator",      {fg = "#EB5E55"})
vim.api.nvim_set_hl(0, "CmpItemKindVariable",      {fg = "#b5e48c"})
vim.api.nvim_set_hl(0, "CmpItemKindFile",          {fg = "#b5e48c"})
vim.api.nvim_set_hl(0, "CmpItemKindUnit",          {fg = "#F0CEA0"})
vim.api.nvim_set_hl(0, "CmpItemKindSnippet",       {fg = "#F0CEA0"})
vim.api.nvim_set_hl(0, "CmpItemKindFolder",        {fg = "#F0CEA0"})
vim.api.nvim_set_hl(0, "CmpItemKindMethod",        {fg = "#F3A712"})
vim.api.nvim_set_hl(0, "CmpItemKindValue",         {fg = "#F3A712"})
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember",    {fg = "#F3A712"})
vim.api.nvim_set_hl(0, "CmpItemKindInterface",     {fg = "#E23E58"})
vim.api.nvim_set_hl(0, "CmpItemKindColor",         {fg = "#E23E58"})
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", {fg = "#E23E58"})
-- -- Glance.
vim.api.nvim_set_hl(0, "GlancePreviewNormal",      {bg = "#000000"})
vim.api.nvim_set_hl(0, "GlancePreviewMatch",       {bg = "#000000"})
vim.api.nvim_set_hl(0, "GlancePreviewSignColumn",  {bg = "#000000"})
vim.api.nvim_set_hl(0, "GlancePreviewLineNr",      {bg = "#000000"})
vim.api.nvim_set_hl(0, "GlanceListNormal",         {bg = "#000000"})
-- -- Saga.
vim.api.nvim_set_hl(0, "SagaNormal",               {bg = ""})
vim.api.nvim_set_hl(0, "SagaBorder",               {bg = ""})

-- Trouble
vim.api.nvim_set_hl(0, "TroubleFoldIcon", {bg = ""})

-- Tree
vim.api.nvim_set_hl(0, "NeoTreeGitAdded",     {bg = "",        fg = "#00B9AE"})
vim.api.nvim_set_hl(0, "NeoTreeGitConflict",  {bg = "",        fg = "#ff0054"})
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted",   {bg = "",        fg = "#E23E58"})
vim.api.nvim_set_hl(0, "NeoTreeGitIgnored",   {bg = "",        fg = "#686f9a"})
vim.api.nvim_set_hl(0, "NeoTreeGitModified",  {bg = "",        fg = "#F3A712"})
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", {bg = "",        fg = "#babd8d"})
vim.api.nvim_set_hl(0, "NeoTreeFloatTitle",   {bg = "#090d12", fg = "#ecf0c1"})
vim.api.nvim_set_hl(0, "NeoTreeFloatNormal",  {bg = "#090d12", fg = ""})
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder",  {bg = "#090d12", fg = "#686f9a"})

-- Mini
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {fg = "#686f9a"})

-- Bookmark
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1

-- Cursor
vim.api.nvim_set_hl(0, "CursorLine",   {bg = "#001f3f", fg=""})
vim.api.nvim_set_hl(0, "CursorLineNr", {bg = "",        fg="#F3A712"})
vim.opt.guicursor = { "a:ver1" }

-- Modes
require('modes').setup()

-- Lazy
vim.api.nvim_set_hl(0, "LazyNormal",  {bg = "#090d12"})
