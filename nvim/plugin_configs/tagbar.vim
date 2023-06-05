
" --------------------------------- "
" ---- "tagbar configuration" ---- "
" --------------------------------- "

lua << EOF
vim.keymap.set('n', 'tbr', ":TagbarToggle<CR>", { noremap = true, silent = true })
EOF
