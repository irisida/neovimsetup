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
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'preservim/nerdcommenter'
    Plug 'ryanoasis/vim-webdevicons'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

colorscheme onedark
map <silent> <c-n> :NERDTreeFocus<CR>

filetype plugin indent on   " required

set number
set wrap
set smartcase
set hlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent


let g:airline_theme='bubblegum'
let g:NERDTreeWinSize=52

" coc configuration 
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-go',
\ 'coc-json'
\ ]


" NERDTree auto opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

