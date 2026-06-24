" (setting up syntax highlight in markdown)
"
let g:markdown_fenced_languages = [
      \ 'c', 'cs', 'cpp', 'csharp',
      \ 'json', 'graphql',
      \]

" (configure options)
setlocal spell spelllang=en_gb,ru_ru
setlocal formatoptions=tcqln 
setlocal textwidth=82 
setlocal shiftwidth=2
setlocal tabstop=2

" (configure quick command to remap all links)
nnoremap <buffer><silent> <leader>lar <Plug>(MarkdownLinksAsReferences)
