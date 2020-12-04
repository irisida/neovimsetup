" curl -flo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

set nocompatible            " be iMproved, required
filetype off                " required
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
    Plug 'chrisbra/Colorizer'
    Plug 'mattn/emmet-vim'

    " debugger for go 
    Plug 'sebdah/vim-delve'

call plug#end()

" -------------------------------------------
" -- Theme settings
" -- ----------------------------------------
set termguicolors
colorscheme onedark  

" --------------------------------------------
" -- airline bottom bar theme
" --------------------------------------------
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" --------------------------------------------
" -- general vim set options
" --------------------------------------------
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
" -- vifm settings 
" -------------------------------------------
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd ="Vifm"
let g:vifm_embed_split=1
let g:vifm_embed_term=1

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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" ------------------------------------------
" language related
" ------------------------------------------
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 1


" ------------------------------------------
" -- NEOVIM terminal settings
" ------------------------------------------
" -- OSX settings 
" ------------------------------------------
nnoremap z :15sp \| term<CR>
tnoremap `z <C-\><C-n>:q<cr>
autocmd TermOpen * startinsert
" ------------------------------------------
" -- WINDOWS settings 
" ------------------------------------------
"tnoremap \z <C-\><C-n>:q<cr>


" ------------------------------------------
" -- editor overrides
" ------------------------------------------
" start vifm
nnoremap m :Vifm<cr>
" select all
nnoremap <C-a> ggVG
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" suggested cut & paste override
set clipboard=unnamedplus


" ------------------------------------------
" -- neovim opacity
" ------------------------------------------
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" ------------------------------------------
" -- GOLANG specific
" ------------------------------------------
let g:go_auto_type_info = 1
set updatetime=30
" ------------------------------------------
" -- GOLANG and MAPLEADER 
" ------------------------------------------
let mapleader=","
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

