" curl -flo $HOME/.config/nvim/autoload/plug.vim --create-dirs \ 
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 
set nocompatible      " be iMproved, required
filetype off          " required
filetype plugin indent on   " required

" -------------------------------------------
" -- plugins settings 
" -------------------------------------------
call plug#begin('~/.config/nvim/plugged')
    " color scheme
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-webdevicons'
    
    " navigation 
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
   
    " git related 
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
   
    " additional features for programming    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'preservim/nerdcommenter'
call plug#end()

" ------------------------------------------- 
" -- Theme settings 
" -- ---------------------------------------- 
colorscheme onedark
" airline bottom bar theme 
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1 
" GVim

" auto reloading changed files
"set autoread
"autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
"autocmd FileChangedShellPost *
"\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" -- general vim set options 
set number relativenumber
set wrap
set smartcase
set hlsearch
set noerrorbells
set tabstop=4 
set softtabstop=4
set shiftwidth=4
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
set lazyredraw
let g:NERDTreeWinSize=52
let NERDTreeHighlightCursorline = 0

nmap <silent> <C-n> :NERDTreeToggle<CR>
" NERDTree auto opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
nmap <Leader>r :NERDTreeRefreshRoot

" ------------------------------------------
" -- fzf 
" ------------------------------------------
nnoremap <C-f> :Files<CR>

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

" language related 
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 1


" ------------------------------------------
" -- neovim terminal settings 
" ------------------------------------------ 
nnoremap <C-z> :12sp \| term<CR>
tnoremap <esc> <C-\><C-n>:q
autocmd TermOpen * startinsert

" ------------------------------------------
" -- editor overrides 
" ------------------------------------------
nnoremap <C-a> ggVG
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" suggested cut & paste override 
set clipboard=unnamedplus
