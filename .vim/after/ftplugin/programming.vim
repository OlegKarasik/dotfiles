set signcolumn=yes

setlocal number
setlocal foldmethod=syntax
setlocal foldlevel=10
setlocal shiftwidth=2
setlocal tabstop=2
setlocal formatoptions=rjcq
setlocal smartindent

" (coc.nvim: configuration)
let g:coc_disable_transparent_cursor = 1

" (coc.nvim: substitute tag function)
set tagfunc=CocTagFunc

" (coc.nvim: hotkeys)
nnoremap <silent><nowait>         gd          <Plug>(coc-definition)
nnoremap <silent><nowait>         gy          <Plug>(coc-type-definition)
nnoremap <silent><nowait>         gi          <Plug>(coc-implementation)
nnoremap <silent><nowait>         gr          <Plug>(coc-references)
nnoremap <silent><nowait>         gu          :call <SID>show_diagnostic()<CR>
nnoremap <silent><nowait>         K           :call <SID>show_documentation()<CR>
nnoremap <silent><nowait>         gcr         <Plug>(coc-rename)
nnoremap <silent><nowait>         gcq         <Plug>(coc-codeaction)
nnoremap <silent><nowait>         gcf         <Plug>(coc-codeaction-refactor)
nnoremap <silent><nowait>         <leader>w   :<C-u>CocDiagnostics<CR>
nnoremap <silent><nowait>         <leader>W   :<C-u>lcl<CR>
nnoremap <silent><nowait>         [w          <Plug>(coc-diagnostic-prev)
nnoremap <silent><nowait>         ]w          <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait>         ]W          :<C-u>lfirst<CR>
nnoremap <silent><nowait>         [W          :<C-u>llast<CR>
nnoremap <silent><nowait>         <leader>q   :<C-u>copen<CR>
nnoremap <silent><nowait>         <leader>Q   :<C-u>ccl<CR>
nnoremap <silent><nowait>         [q          :<C-u>cprev<CR>
nnoremap <silent><nowait>         ]q          :<C-u>cnext<CR>
nnoremap <silent><nowait>         ]Q          :<C-u>cfirst<CR>
nnoremap <silent><nowait>         [Q          :<C-u>clast<CR>
nnoremap <silent><nowait>         <C-H>       :call coc#float#close_all() \| redraw!<CR>
nnoremap <silent><nowait><expr>   <C-J>       coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<C-J>"
nnoremap <silent><nowait><expr>   <C-K>       coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<C-K>"
inoremap <silent><nowait><expr>   <C-J>       coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<C-J>"
inoremap <silent><nowait><expr>   <C-K>       coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<C-K>"
inoremap <silent><nowait><expr>   <Enter>     coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"
inoremap <silent><nowait><expr>   <C-H>       coc#float#close_all()
inoremap <silent><nowait>         <C-S>       <C-R>=CocActionAsync('showSignatureHelp')<CR>
inoremap <silent><nowait><expr>   <C-P>       coc#pum#visible() ? coc#pum#prev(1) : coc#refresh()
inoremap <silent><nowait><expr>   <C-N>       coc#pum#visible() ? coc#pum#next(1) : coc#refresh()

" (coc.nvim: configure signature help)
function! s:show_signature()
  call CocAction('showSignatureHelp')
endfunction

" (coc.nvim: configure diagnostics about the issue)
function! s:show_diagnostic()
  call CocAction('diagnosticInfo')
endfunction

" (coc.nvim: configure information about the symbol)
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" (coc.nvim: colours)
autocmd ColorScheme * hi! link CocMenuSel PmenuSel
autocmd ColorScheme * hi! link CocFloating Pmenu
autocmd ColorScheme * hi! link CocPumMenu Pmenu
autocmd ColorScheme * hi! link CocPumVirtualText Comment
autocmd ColorScheme * hi! link CocWarningSign WarningMsg
autocmd ColorScheme * hi! link CocErrorSign ErrorMsg 
autocmd ColorScheme * hi! link CocErrorFloat ErrorMsg
