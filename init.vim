" curl -flo $HOME/.config/nvim/autoload/plug.vim --create-dirs \ 
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 
set nocompatible      " be iMproved, required
filetype off          " required

call plug#begin('~/.config/nvim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'preservim/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme onedark
map <silent> <c-n> :NERDTreeFocus<CR>

filetype plugin indent on   " required

set number
set nowrap
set smartcase
set hlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
