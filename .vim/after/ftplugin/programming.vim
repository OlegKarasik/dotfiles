set signcolumn=yes

setlocal number
setlocal foldmethod=syntax
setlocal foldlevel=10
setlocal shiftwidth=2
setlocal tabstop=2

" (coc.nvim: configuration)
let g:coc_disable_transparent_cursor = 1

" (coc.nvim: hotkeys)
nnoremap <silent><nowait> [g          <Plug>(coc-diagnostic-prev)
nnoremap <silent><nowait> ]g          <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> gd          <Plug>(coc-definition)
nnoremap <silent><nowait> gD          <Plug>(coc-implementation)
nnoremap <silent><nowait> gr          <Plug>(coc-references)
nnoremap <silent><nowait> gu          :call <SID>show_diagnostic()<CR>
nnoremap <silent><nowait> gi          :call <SID>show_documentation()<CR>
nnoremap <silent><nowait> <leader>rn  <Plug>(coc-rename)
nnoremap <silent><nowait> <leader>rq  <Plug>(coc-codeaction)
nnoremap <silent><nowait> <leader>re  <Plug>(coc-codeaction-refactor)
nnoremap <silent>         <leader>w   :<C-u>CocDiagnostics<CR>
nnoremap <silent>         <leader>W   :<C-u>lcl<CR>
nnoremap <silent>         [w          :<C-u>lprev<CR>
nnoremap <silent>         ]w          :<C-u>lnext<CR>
nnoremap <silent>         <leader>q   :<C-u>copen<CR>
nnoremap <silent>         <leader>Q   :<C-u>ccl<CR>
nnoremap <silent>         [q          :<C-u>cprev<CR>
nnoremap <silent>         ]q          :<C-u>cnext<CR>
inoremap <silent><expr>   <Enter>     coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"
inoremap <silent><expr>   <Esc>       coc#pum#visible() ? coc#pum#cancel()  : "\<Esc>"
inoremap <silent>         <C-I>       <C-R>=CocActionAsync('showSignatureHelp')<CR>
inoremap <silent><expr>   <C-P>       coc#pum#visible() ? coc#pum#prev(1)   : coc#refresh()
inoremap <silent><expr>   <C-N>       coc#pum#visible() ? coc#pum#next(1)   : coc#refresh()

" (vimspecter: hotkeys)
nnoremap <leader>de :call vimspector#Launch()<CR>
nnoremap <leader>dE :call vimspector#Reset()<CR>
nnoremap <leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dT :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>dp <Plug>VimspectorPause
nnoremap <leader>di <Plug>VimspectorBalloonEval
nnoremap <leader>dc <Plug>VimspectorContinue

nnoremap <F5>       <Plug>VimspectorContinue
nnoremap <F8>       <Plug>VimspectorRunToCursor
nnoremap <F10>      <Plug>VimspectorStepOver
nnoremap <F11>     	<Plug>VimspectorStepInto
nnoremap <F12>     	<Plug>VimspectorStepOut

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
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
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
