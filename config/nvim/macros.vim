" _  _ ____ ____ ____ ____ ____ 
" |\/| |__| |    |__/ |  | [__  
" |  | |  | |___ |  \ |__| ___]  
map cpp :!echo "%"<CR>
map <C-b> :NvimTreeToggle<CR>

" Remapping arrow keys so i can't use them
inoremap <Up> <Esc>:qa!<CR>
inoremap <Down> <Esc>:qa!<CR>
inoremap <Left> <Esc>:qa!<CR>
inoremap <Right> <Esc>:qa!<CR>

nnoremap <Up> <Esc>:qa!<CR>
nnoremap <Down> <Esc>:qa!<CR>
nnoremap <Left> <Esc>:qa!<CR>
nnoremap <Right> <Esc>:qa!<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
