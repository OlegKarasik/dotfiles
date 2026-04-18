" (implements conceal for markdown links)
syn region markdownLink matchgroup=markdownLinkDelimiter
  \ start="(" end=")" keepend contained conceal contains=markdownUrl
