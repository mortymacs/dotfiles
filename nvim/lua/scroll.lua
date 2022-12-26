require('neoscroll').setup{}
local t = {}
t['<C-Up>']   = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
t['<C-Down>'] = {'scroll', {'vim.wo.scroll' , 'true', '250'}}
require('neoscroll.config').set_mappings(t)
