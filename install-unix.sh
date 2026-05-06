#!/bin/bash
#

# Create directories
#
if [ ! -d "$HOME/.vim/after/ftplugin" ]; then
  mkdir -p "$HOME/.vim/after/ftplugin"
fi
if [ ! -d "$HOME/.vim/after/syntax" ]; then
  mkdir -p "$HOME/.vim/after/syntax"
fi

# Link files from the repository
#
if [ ! -f "$HOME/.vim/after/ftplugin/cpp.vim" ]; then
  ln -s ".vim/after/ftplugin/cpp.vim" "$HOME/.vim/after/ftplugin/cpp.vim"
fi
if [ ! -f "$HOME/.vim/after/ftplugin/markdown.vim" ]; then
  ln -s ".vim/after/ftplugin/markdown.vim" "$HOME/.vim/after/ftplugin/markdown.vim"
fi
if [ ! -f "$HOME/.vim/after/ftplugin/programming.vim" ]; then
  ln -s ".vim/after/ftplugin/programming.vim" "$HOME/.vim/after/ftplugin/programming.vim"
fi
if [ ! -f "$HOME/.vim/after/syntax/markdown.vim" ]; then
  ln -s ".vim/after/syntax/markdown.vim" "$HOME/.vim/after/syntax/markdown.vim"
fi
if [ ! -f "$HOME/.vim/coc-settings.json" ]; then
  ln -s ".vim/coc-settings.json" "$HOME/.vim/coc-settings.json"
fi
if [ ! -f "$HOME/.vimrc" ]; then
  ln -s ".vimrc" "$HOME/.vimrc"
fi
