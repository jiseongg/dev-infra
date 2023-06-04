
" ----------------------------------- "
" ---- "nvim-tree configuration" ---- "
" ----------------------------------- "

lua << EOF
-- nvim-tree
-- dsiable netrw at the very start of innit.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight group
vim.opt.termguicolors = true

-- keymap
vim.keymap.set('n', 'hnvt', ":help nvim-tree-commands<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'nvt', ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'nvo', ":NvimTreeFocus<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'nvf', ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

-- empty setup using defaults
-- require("nvim-tree").setup()

-- setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF


