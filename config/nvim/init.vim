" I use the ~/.config/nvim directory
let $CONFIG_PATH = stdpath('config')
source $CONFIG_PATH/airline.vim
source $CONFIG_PATH/plug.vim
source $CONFIG_PATH/macros.vim
source $CONFIG_PATH/coc.vim
source $CONFIG_PATH/telescope.vim

"let &t_ut=''
colorscheme catppuccin
set number relativenumber
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set clipboard=unnamedplus
set cursorline
set ttyfast
set noswapfile
set backupdir=~/.cache/vim
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
set splitbelow
set splitright

lua << EOF
require("config")
EOF

