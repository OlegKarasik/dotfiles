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

# Source script directory
#
SOURCE=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo $SOURCE

# Link files from the repository
#
if [ ! -f "$HOME/.vim/after/ftplugin/cpp.vim" ]; then
  ln -sf "$SOURCE/.vim/after/ftplugin/cpp.vim" "$HOME/.vim/after/ftplugin/cpp.vim"
fi
if [ ! -f "$HOME/.vim/after/ftplugin/markdown.vim" ]; then
  ln -sf "$SOURCE/.vim/after/ftplugin/markdown.vim" "$HOME/.vim/after/ftplugin/markdown.vim"
fi
if [ ! -f "$HOME/.vim/after/ftplugin/programming.vim" ]; then
  ln -sf "$SOURCE/.vim/after/ftplugin/programming.vim" "$HOME/.vim/after/ftplugin/programming.vim"
fi
if [ ! -f "$HOME/.vim/after/syntax/markdown.vim" ]; then
  ln -sf "$SOURCE/.vim/after/syntax/markdown.vim" "$HOME/.vim/after/syntax/markdown.vim"
fi
if [ ! -f "$HOME/.vim/coc-settings.json" ]; then
  ln -sf "$SOURCE/.vim/coc-settings.json" "$HOME/.vim/coc-settings.json"
fi
if [ ! -f "$HOME/.vimrc" ]; then
  ln -sf "$SOURCE/.vimrc" "$HOME/.vimrc"
fi
if [ ! -f "$HOME/.gitignore" ]; then
  ln -sf "$SOURCE/.gitignore" "$HOME/.gitignore"

  # Setup global ignore file
  # 
  git config --global core.excludesfile "$SOURCE/.gitignore"
fi
