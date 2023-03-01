    vim.cmd.colorscheme("spaceduck")
vim.g.lightline = {
    colorscheme = 'spaceduck',
}

-- Body
vim.api.nvim_set_hl(0, "Normal",      {bg = ""})
vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = "", fg = "#060606"})
vim.api.nvim_set_hl(0, "LineNr",      {bg = "", fg = "#686f9a"})
vim.api.nvim_set_hl(0, "SignColumn",  {bg = ""})
vim.api.nvim_set_hl(0, "VertSplit",   {bg = "", fg = "#1b1c36"})
vim.api.nvim_set_hl(0, "NonText",     {bg = "", fg = ""})

-- Statusline
vim.api.nvim_set_hl(0, "StatusLine",     {bg = "", fg = ""})
vim.api.nvim_set_hl(0, "StatusLineTerm", {bg = "", fg = ""})

-- Cmd
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", {bg = "#060606", fg = ""})
vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",              {bg = "#060606", fg = ""})

-- Git
vim.api.nvim_set_hl(0, "GitSignsAdd",    {bg = "", fg = "#5ccc96"})
vim.api.nvim_set_hl(0, "GitSignsChange", {bg = "", fg = "#e39400"})
vim.api.nvim_set_hl(0, "GitSignsDelete", {bg = "", fg = "#ce6f8f"})

-- Terminal
vim.api.nvim_set_hl(0, "FloatermBorder", {fg = "#1b1c36"})
vim.api.nvim_set_hl(0, "Floaterm",       {fg = "#1b1c36"})

-- Notification
vim.api.nvim_set_hl(0, "NotifyDEBUGBody",  {bg = "#060606"})
vim.api.nvim_set_hl(0, "NotifyINFOBody",   {bg = "#060606"})
vim.api.nvim_set_hl(0, "NotifyWARNBody",   {bg = "#060606"})
vim.api.nvim_set_hl(0, "NotifyERRORBody",  {bg = "#060606"})
vim.api.nvim_set_hl(0, "NotifyTRACEBody",  {bg = "#060606"})
vim.api.nvim_set_hl(0, "NotifyBackground", {bg = "#060606"})

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal",        {bg = "#060606"})
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {bg = "#060606"})
vim.api.nvim_set_hl(0, "TelescopePromptNormal",  {bg = "#060606"})
vim.api.nvim_set_hl(0, "TelescopeResultNormal",  {bg = "#060606"})

-- Development
vim.api.nvim_set_hl(0, "FidgetTitle", {bg = "#060606"})
vim.api.nvim_set_hl(0, "FidgetTask",  {bg = "#060606"})

-- LSP
vim.api.nvim_set_hl(0, "Pmenu",                    {fg = "#ecf0c1", bg = "#22223b"})
vim.api.nvim_set_hl(0, "PmenuSel",                 {fg = "#EED8DA", bg = "#B5585F"})
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
vim.api.nvim_set_hl(0, "GlancePreviewNormal",      {bg = "#181818"})
vim.api.nvim_set_hl(0, "GlancePreviewMatch",       {bg = "#181818"})
vim.api.nvim_set_hl(0, "GlancePreviewSignColumn",  {bg = "#181818"})
vim.api.nvim_set_hl(0, "GlancePreviewLineNr",      {bg = "#181818"})
vim.api.nvim_set_hl(0, "GlanceListNormal",         {bg = "#181818"})

-- Trouble
vim.api.nvim_set_hl(0, "TroubleFoldIcon", {bg = ""})

-- FM
vim.api.nvim_set_hl(0, "NvimTreeStatusLine", {bg = "", fg = ""})

-- Mini
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {fg = "#686f9a"})

-- Bookmark
vim.g.bookmark_sign = ''
vim.g.bookmark_highlight_lines = 1
