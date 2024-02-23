-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()` vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et

vim.keymap.set('n', '<leader>\\', "<cmd>vsplit<cr>", { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>-', "<cmd>split<cr>", { desc = 'Horizontal Split' })

vim.keymap.set('n', '<leader>q', "<cmd>confirm q<cr>", { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', "<cmd>confirm qall<cr>", { desc = 'Quit All' })
vim.keymap.set('n', '<leader>w', "<cmd>w<cr>", { desc = 'Save' })
vim.keymap.set('n', '<leader>wa', "<cmd>wall<cr>", { desc = 'Save all' })

-- neo tree mappings
vim.keymap.set('n', '<leader>e', "<cmd>Neotree toggle<cr>", { desc = 'Toggle Explorer' })

vim.keymap.set('n', ']t', function()
  vim.cmd.tabnext()
end, { desc = 'Toggle Explorer' })

-- harpoon setups
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Harpoon Append" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Quick Menu" })

vim.keymap.set("n", "<leader>u", function() harpoon:list():select(1) end, { desc = "Harpoon Select 1" })
vim.keymap.set("n", "<leader>i", function() harpoon:list():select(2) end, { desc = "Harpoon Select 2" })
vim.keymap.set("n", "<leader>o", function() harpoon:list():select(3) end, { desc = "Harpoon Select 3" })
vim.keymap.set("n", "<leader>p", function() harpoon:list():select(4) end, { desc = "Harpoon Select 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end, { desc = "Harpoon Previous" })
vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end, { desc = "Harpoon Next" })
