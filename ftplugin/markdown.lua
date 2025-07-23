local runner = require 'quarto.runner'

vim.keymap.set('n', '<cr>', runner.run_cell, { desc = 'run cell', silent = true, buffer = 0 })
vim.keymap.set('n', '<S-cr>', runner.run_above, { desc = 'run cell and above', silent = true, buffer = 0 })
vim.keymap.set('n', '<localleader>rA', runner.run_all, { desc = 'run all cells', silent = true, buffer = 0 })
vim.keymap.set('n', '<localleader>rl', runner.run_line, { desc = 'run line', silent = true, buffer = 0 })
vim.keymap.set('v', '<cr>', runner.run_range, { desc = 'run visual range', silent = true, buffer = 0 })

vim.keymap.set('n', '<localleader>RA', function()
  runner.run_all(true)
end, { desc = 'run all cells of all languages', silent = true, buffer = 0 })

vim.keymap.set('n', '<localleader>mi', ':MoltenInit<CR>', { silent = true, desc = 'Initialize the plugin', buffer = 0 })
vim.keymap.set('n', '<localleader>e', ':MoltenEvaluateOperator<CR>', { silent = true, desc = 'run operator selection', buffer = 0 })
vim.keymap.set('n', '<localleader>rr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 're-evaluate cell' })
vim.keymap.set('v', '<localleader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = 'evaluate visual selection', buffer = 0 })
vim.keymap.set('n', '<localleader>oh', ':MoltenHideOutput<CR>', { desc = 'close output window', silent = true, buffer = 0 })
vim.keymap.set('n', '<localleader>md', ':MoltenDelete<CR>', { desc = 'delete Molten cell', silent = true, buffer = 0 })

-- if you work with html outputs:
vim.keymap.set('n', '<localleader>mx', ':MoltenOpenInBrowser<CR>', { desc = 'open output in browser', silent = true, buffer = 0 })
vim.keymap.set('n', '<localleader>ip', function()
  local venv = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX'
  if venv ~= nil then
    -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
    venv = string.match(venv, '/.+/(.+)')
    vim.cmd(('MoltenInit %s'):format(venv))
  else
    vim.cmd 'MoltenInit python3'
  end
end, { desc = 'Initialize Molten for python3', silent = true, buffer = 0 })

require('quarto').activate()
