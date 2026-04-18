" Configuring Vim-Plug
"
filetype off
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'
Plug 'OlegKarasik/vim-cmake-naive'
Plug 'OlegKarasik/vim-markdown-links-naive'
Plug 'OlegKarasik/vim-buffers-naive'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'puremourning/vimspector'

call plug#end()
filetype plugin indent on
"
" End Configuring Vim-Plug

" Configuring Basics
"
set laststatus=2
set updatetime=100
set ttimeout ttimeoutlen=15
set encoding=utf-8
set scrolloff=4
set signcolumn=no
set termguicolors
set showcmd
set nocompatible
set cul

" (do not store global and local values inside a session, and folds)
set ssop-=options
set ssop-=folds

colorscheme dracula

scriptencoding utf-8
syntax on
"
" End Configuring Basics

" Configuring Netrw
"
let g:netrw_banner       = 0
let g:netrw_winsize      = 30
let g:netrw_browse_split = 0
let g:netrw_list_hide    = '\(^\|\s\s\)\zs\.\S\+'
"
" End Configuring Netrw

" Configuring Macro and Hotkeys
"
" (basic mappings)
inoremap <C-H>      <left>
inoremap <C-L>      <right>
inoremap <C-J>      <down>
inoremap <C-K>      <up>
inoremap <C-@>      <ENTER>
nnoremap <F1>       "=strftime("%F")<CR>P
nnoremap <F2>       :wa<Bar>exe "mksession! " .. v:this_session<CR>
nnoremap <leader>f  :Ex<CR>
nnoremap <leader>b  <Plug>(BuffersList) 
nnoremap <NL>       i<CR><ESC>

" (plugin: EasyAlign)
nnoremap <silent>ga <Plug>(EasyAlign)
vnoremap <silent>ga <Plug>(EasyAlign)
"
" End Configuring Maro and Hotkeys

" Configuring Russian Keyboard
"
" (enable keymap for Mac - Russian)
set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0

" (map SHIFT+OPTIONS+1 - reverse ! to |)
inoremap ⁄ \| 
" (map OPTIONS+8       - bullet    to *)
inoremap • *
" (map OPTIONS+3       - EURO      to #)
inoremap £ #
"
" End Configuring Russian Keyboard

" Configuring Formatting
"
set shiftwidth=2
set tabstop=2

set autoindent
set smartindent
set expandtab

" (recognise .txt files like markdown and configure them)
autocmd FileType text 
      \   setlocal filetype=markdown
      \ | setlocal syntax=markdown

" (configure settings for code files)
autocmd FileType cpp 
      \ :runtime! ftplugin/programming.vim 
"
" End Configuring Formatting
