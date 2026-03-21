" Configuring Vundle
"
filetype off
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'
Plug 'OmniSharp/omnisharp-vim'

call plug#end()
filetype plugin indent on
"
" End Configuring Vundle

" Configuring Basics
"
set ttimeout ttimeoutlen=15
set encoding=utf-8
set scrolloff=4

set showcmd
set nocompatible

scriptencoding utf-8
syntax on
"
" End Configuring Basics

" Configuring Netrw
"
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_winsize      = 30
let g:netrw_browse_split = 0
let g:netrw_list_hide    = '\(^\|\s\s\)\zs\.\S\+'
"
" End Configuring Netrw

" Configuring OmniShart
"
let $DOTNET_ROOT = "/usr/local/share/dotnet"

let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_server_use_mono = 0
let g:OmniSharp_server_stdio    = 1
"
" End Configuring OmniSharp

" Configuring Macro and Hotkeys
"
nnoremap ga          <Plug>(EasyAlign)
nnoremap <F1>        "=strftime("%F")<CR>P
nnoremap <leader>f   :Ex<CR>
nnoremap <NL>        i<CR><ESC>
inoremap <expr><C-@> coc#refresh()
inoremap <expr>j     coc#pum#visible() ? coc#pum#next(1) : "\j"
inoremap <expr>k     coc#pum#visible() ? coc#pum#prev(1) : "\k"
inoremap <expr><CR>  coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"
" End Configuring Macro and Hotkeys

" Configuring Markdown
"
"(setting up syntax highlight in markdown)
let g:markdown_fenced_languages = [
      \ 'c', 'cs', 'cpp',
      \ 'json', 'graphql',
      \]
" End Configuring Markdown

" Configuring Russian Keyboard
"
"(enable keymap for Mac - Russian)
set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0

"(map SHIFT+OPTIONS+1 - reverse ! to |)
inoremap ⁄ \| 
"(map SHIFT+OPTIONS+8 - degree    to *)
inoremap ° *
"(map SHIFT+OPTIONS+3 - left      to #)
inoremap ‹ #
"
" End Configuring Russian Keyboard

" Configuring Formatting
"
set shiftwidth=2
set tabstop=2

set autoindent
set smartindent
set expandtab
"
"(recognise .txt files like markdown)
autocmd FileType text 
      \   setlocal filetype=markdown
      \ | setlocal syntax=markdown
      \ | setlocal formatoptions=tcqln 
      \ | setlocal textwidth=82 
"
" End Configuring Formatting
