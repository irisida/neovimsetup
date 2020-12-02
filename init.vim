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
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'ayu-theme/ayu-vim'


    " navigation
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vifm/vifm.vim' 

    " git related
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " additional features for programming
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'preservim/nerdcommenter'
    Plug 'ap/vim-css-color'
call plug#end()

" -------------------------------------------
" -- Theme settings
" -- ----------------------------------------
set termguicolors

" onedark specific
colorscheme onedark

" aye specific
"let ayucolor="mirage"
"colorscheme ayu

" set syntax

" --------------------------------------------
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
" -- when u:ser type 'cmd /'
" -------------------------------------------
" vmap @@@ <plug>NERDCommenterToggle
" nmap @@@ <plug>NERDCommenterToggle

" -------------------------------------------
" -- vifm settings 
" -------------------------------------------
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd ="Vifm"
let g:vifm_embed_split=1
let g:vifm_embed_term=1

" -------------------------------------------
" -- NERDTree settings
" -- the tree is toggled with 'ctrl n' combo
" -- window switcher is 'ctrl ww'
" -- the tree menu is opened with 'm'
" -- 'a' to create and lead with a '/' for
" -- directory creation
" -------------------------------------------
set lazyredraw

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

inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" language related
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 1


" ------------------------------------------
" -- neovim terminal settings
" ------------------------------------------
"nmap <D-z> :12sp \| term<CR>
nnoremap z :15sp \| term<CR>
tnoremap `z <C-\><C-n>:q<cr>
autocmd TermOpen * startinsert

" ------------------------------------------
" -- editor overrides
" ------------------------------------------
" start vifm
nnoremap m :Vifm<cr>
"select all
nnoremap <C-a> ggVG
" Copy to clipboard
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


" ------------------------------------------
" neovim opacity
" ------------------------------------------
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

