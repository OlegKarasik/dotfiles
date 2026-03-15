" Configuring Vundle
"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
" Plugin 'preservim/vim-markdown'
Plugin 'OmniSharp/omnisharp-vim'

call vundle#end()
filetype plugin indent on
"
" End Configuring Vundle

" Configuring Basics
"
set ttimeout ttimeoutlen=15
set nocompatible
set encoding=utf-8

scriptencoding utf-8
syntax on
"
" End Configuring Basics

" Configuring Macro and Hotkeys
"
nnoremap <F1> "=strftime("%F")<CR>P
nnoremap <NL> i<CR><ESC>
"
" End Configuring Macro and Hotkeys

" Configuring Vim-Markdown
"
let g:vim_markdown_folding_disabled = 1
"autocmd FileType markdown setlocal formatoptions-=o formatoptions-=r
"
" End Configuring Vim-Markdown

" Configuring OmniShart
"
let $DOTNET_ROOT = "/usr/local/share/dotnet"

let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_server_use_mono = 0
let g:OmniSharp_server_stdio    = 1
"
" End Configuring OmniSharp

" Configuring Russian Keyboard
"
"(enable keymap for Mac - Russian)
set keymap=russian-jcukenmac 
set iminsert=0
set imsearch=0

"(map SHIFT+OPTIONS+1 - reverse ! to |)
inoremap ⁄ \| 
"
" End Configuring Russian Keyboard

" Configuring Formatting
"
"(recognise numbered lists -- n -- and break long lines -- t --)
set formatoptions+=nt
set autoindent
set smartindent
set textwidth=82
set shiftwidth=2
set expandtab
"
" End Configuring TextWidth
