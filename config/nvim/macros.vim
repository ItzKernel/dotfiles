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

function Semicolonshit()
    let pos = getpos('.')
    let currentMode = mode()
    " startinsert!
    " call feedkeys(';')
    norm A;

    call mode(currentMode)
    call setpos('.', pos)
endfunction

command Semi :call Semicolonshit()

map <C-;> :Semi<CR>
