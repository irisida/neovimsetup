" curl -flo $HOME/.config/nvim/autoload/plug.vim --create-dirs \ 
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 
set nocompatible      " be iMproved, required
filetype off          " required
filetype plugin indent on   " required

" -------------------------------------------
" -- plugins settings 
" -------------------------------------------
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

" ------------------------------------------- 
" -- Theme settings 
" -- ---------------------------------------- 
colorscheme onedark
" airline bottom bar theme 
let g:airline_theme='bubblegum'


" -- general vim set options 
set number
set wrap
set smartcase
set hlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set splitbelow
set splitright

" -------------------------------------------
" -- NERDCommenter settings are set to @@@
" -- this is configured to be sent in iterm2
" -- when user type 'cmd /' 
" -------------------------------------------
vmap @@@ <plug>NERDCommenterToggle
nmap @@@ <plug>NERDCommenterToggle


" -------------------------------------------
" -- NERDTree settings 
" -- the tree is toggled with 'ctrl n' combo
" -- window switcher is 'ctrl ww'
" -- the tree menu is opened with 'm'
" -- 'a' to create and lead with a '/' for
" -- directory creation 
" -------------------------------------------
nmap <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=52
" NERDTree auto opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ------------------------------------------
" -- Intellisense and code completion with 
" -- the Coc plugin. 
" -- installable language servers for most
" -- programming languages that allow for 
" -- strong IDE like editing capbilities. 
" ------------------------------------------
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-go',
\ 'coc-json'
\ ]

" ------------------------------------------
" -- neovim terminal settings 
" ------------------------------------------ 
nnoremap <esc><esc> :12sp \| term<CR>
tnoremap <esc> <C-\><:q!CR>


