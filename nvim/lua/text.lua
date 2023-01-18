-- General
require('insx.preset.standard').setup()
require('trim').setup()

-- Move lines
require('mini.move').setup({
  mappings = {
    left = '',
    right = '',
    down = '<s-m-down>',
    up = '<s-m-up>',
    line_left = '',
    line_right = '',
    line_down = '<s-m-down>',
    line_up = '<s-m-up>',
  },
})

-- Indentation
require('mini.indentscope').setup({
    draw = {
        delay = 10,
    },
})
