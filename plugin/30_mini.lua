vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- Common configuration presets.
require('mini.basics').setup({
  options = { basic = false },
  mappings = { windows = true },
})

-- Icon provider.
require('mini.icons').setup()

-- Extra 'mini.nvim' functionality.
require('mini.extra').setup()

-- Extend and create a/i textobjects.
local ai = require('mini.ai')
ai.setup({
  custom_textobjects = {
    B = MiniExtra.gen_ai_spec.buffer(),
    F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
  },
})

-- Align text.
require('mini.align').setup()

-- Comment lines.
require('mini.comment').setup()

-- Highlight patterns in text.
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
    hack  = { pattern = 'HACK',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = 'TODO',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = 'NOTE',  group = 'MiniHipatternsNote'  },

    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- Visualize and work with indent scope.
local indentscope = require('mini.indentscope')
indentscope.setup({
  draw = { animation = indentscope.gen_animation.none() },
  options = { try_as_border = true },
  symbol = '│',
})

-- Move any selection in any direction.
require('mini.move').setup()

-- Text edit operators.
require('mini.operators').setup()

-- Split and join arguments.
require('mini.splitjoin').setup()

-- Surround actions: add, delete, replace.
require('mini.surround').setup()

-- Highlight and remove trailspace.
require('mini.trailspace').setup()
