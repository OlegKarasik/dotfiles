" Configuring Vim-Plug
"
filetype off
call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'OlegKarasik/vim-cmake-naive'
Plug 'OlegKarasik/vim-markdown-links-naive'
Plug 'OlegKarasik/vim-buffers-naive'
Plug 'OlegKarasik/vim-remote-naive'
Plug 'OlegKarasik/vim-windows-naive'
Plug 'OlegKarasik/vim-lsp-naive'

Plug 'dracula/vim', {'as': 'dracula'}

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
set nojoinspaces
set cul
set ttyfast
set belloff=all

let mapleader=' '

" (ensure to enable basic options on Windows)
if has('win32')
  set renderoptions=type:directx
  set nofixeol
endif

" (ensure UNDO is possible after buffer is written)
if has('persistent_undo')      
  set undofile                
  set undodir=$HOME/.vim/undo
endif

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

" Configuring CTRL-P
"
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore     = '\v[\/](\.(git|hg|svn)|build)$'
"
" End Configuring CTRL-P

" Configuring asyncomplete
"
let g:asyncomplete_auto_popup = 0

inoremap <silent><nowait><expr> <C-P>   pumvisible() ? "\<C-P>" : asyncomplete#force_refresh()
inoremap <silent><nowait><expr> <C-N>   pumvisible() ? "\<C-N>" : asyncomplete#force_refresh()
inoremap <silent><nowait><expr> <Enter> pumvisible() ? asyncomplete#close_popup() : "\<Enter>"
"
" End Configuring asyncomplete

" Configuring vim-lsp
"
function! s:on_lsp_buffer_enabled() abort
  " (vim-lsp: settings)
  setlocal omnifunc=lsp#complete
  setlocal tagfunc=lsp#tagfunc

  " (vim-lsp: hotkeys)
  nnoremap <buffer><silent><nowait>       gd          <Plug>(lsp-definition)
  nnoremap <buffer><silent><nowait>       gD          <Plug>(lsp-implementation)
  nnoremap <buffer><silent><nowait>       gr          <Plug>(lsp-references)
  "nnoremap <buffer><silent><nowait>       ,           :call <SID>show_diagnostic()<CR>
  nnoremap <buffer><silent><nowait>       K           <plug>(lsp-hover-float)
  nnoremap <buffer><silent><nowait>       <leader>rn  <Plug>(lsp-rename)
  nnoremap <buffer><silent><nowait>       <leader>qf  <Plug>(lsp-code-lens)
  nnoremap <buffer><silent><nowait>       <leader>qa  <Plug>(lsp-code-action-float)
  nnoremap <buffer><silent><nowait>       <leader>dl  <Plug>(lsp-document-diagnostics)
  nnoremap <buffer><silent><nowait>       <leader>ss  <Plug>(lsp-workspace-symbol-search)
  nnoremap <buffer><silent><nowait>       [e          <Plug>(lsp-previous-error)
  nnoremap <buffer><silent><nowait>       ]e          <Plug>(lsp-next-error)
  nnoremap <buffer><silent><nowait>       [w          <Plug>(lsp-previous-warning)
  nnoremap <buffer><silent><nowait>       ]w          <Plug>(lsp-next-warning)
  nnoremap <buffer><silent><nowait>       <C-S>       :LspSignatureHelp<Enter>
  nnoremap <buffer><silent><nowait>       <C-L>       <Plug>(lsp-float-close)
  nnoremap <buffer><silent><nowait><expr> <C-J>       lsp#scroll(+4)
  nnoremap <buffer><silent><nowait><expr> <C-K>       lsp#scroll(-4)
  inoremap <buffer><silent><nowait>       <C-S>       <C-O>:LspSignatureHelp<Enter>
  "inoremap <buffer><silent><nowait>       <C-L>       <Plug>(lsp-float-close)
  inoremap <buffer><silent><nowait><expr> <C-J>       lsp#scroll(+4)
  inoremap <buffer><silent><nowait><expr> <C-K>       lsp#scroll(-4)
endfunction

" (vim-lsp: global configuration)
let g:lsp_auto_enable = 1
let g:lsp_semantic_enabled = 1
let g:lsp_signature_help_enabled = 0
let g:lsp_document_highlight_enabled = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_async_completion = 1

if executable('csharp-ls')
  let g:lsp_setup_called_cs = []

  function! HandleLspMetadataUrls(uri)
    let l:res = lsp#request('csharp-ls', {
        \ 'method': 'csharp/metadata',
        \ 'params': { 'textDocument': { 'uri': a:uri } }
        \ })
  endfunction

  function! HandleLspSetup()
    let root = lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(),
      \     ['*.slnx', '*.sln', '*.csproj', '.git', '.git/']
      \   )
      \ )
    if empty(root)
      root = getcwd()
    endif
    if index(g:lsp_setup_called_cs, root) < 0
      call lsp#register_server({
        \ 'name': 'csharp-ls',
        \ 'cmd': {server_info->['csharp-ls', '--features', 'metadata-uris']},
        \ 'allowlist': ['cs'],
        \ 'root_uri': {server_info->root},
        \ 'config': {},
        \ 'workspace_config': {},
        \ })

      call add(g:lsp_setup_called_cs, root)
    endif
  endfunction

  augroup lsp_configure
    au!
    autocmd User lsp_setup call HandleLspSetup()
    autocmd BufReadCmd csharp:/* call s:HandleLspMetadataUrls(expand("<amatch>"))
  augroup END
endif

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_log_file = ''
	let g:lsp_log_file = expand('~/vim-lsp.log')
"
" End Configuring vim-lsp

" Configuring Macro and Hotkeys
"
" (basic mappings)
inoremap <C-@>      <ENTER>
nnoremap <F1>       "=strftime("%F")<CR>P
nnoremap <F2>       :wa<Bar>exe "mksession! " .. v:this_session<CR>
nnoremap <leader>f  :Ex<CR>
nnoremap <leader>b  <Plug>(BuffersList) 
nnoremap <leader>m  <Plug>(MaximizeToggleActiveWindow)
nnoremap <leader>J  i<CR><ESC>

" (plugin: EasyAlign)
nnoremap <silent>ga <Plug>(EasyAlign)
vnoremap <silent>ga <Plug>(EasyAlign)
"
" End Configuring Macro and Hotkeys

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
set expandtab

" (recognise .txt files like markdown and configure them)
autocmd FileType text 
      \   setlocal filetype=markdown
      \ | setlocal syntax=markdown

" (configure settings for code files)
autocmd FileType cpp,cs,ps1 
      \   setlocal signcolumn=yes
      \ | setlocal foldmethod=syntax
      \ | setlocal foldlevel=10
      \ | setlocal formatoptions=rjcq
      \ | setlocal smartindent
      \ | setlocal number
"
" End Configuring Formatting
