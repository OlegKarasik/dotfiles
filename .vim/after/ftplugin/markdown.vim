" (setting up syntax highlight in markdown)
let g:markdown_fenced_languages = [
      \ 'c', 'cs', 'cpp',
      \ 'json', 'graphql',
      \]

" (configure format options and textwidth)
setlocal formatoptions=tcqln 
setlocal textwidth=82 
setlocal shiftwidth=2
setlocal tabstop=2

" (configure quick command to remap all links)
nnoremap <silent><expr> <leader>cm vmarkdown_links_as_references#convert()
