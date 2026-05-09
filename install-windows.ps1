# Create directories
#
if (-not (Test-Path -Path "%USERPROFILE%\vimfiles\after\ftplugin")) {
  New-Item -Path "%USERPROFILE%\vimfiles\after\ftplugin" -ItemType Directory;
}
if (-not (Test-Path -Path "%USERPROFILE%\vimfiles\after\syntax")) {
  New-Item -Path "%USERPROFILE%\vimfiles\after\syntax" -ItemType Directory;
}

# Source script directory
#
$SOURCE=$PSScriptRoot

# Link files from the repository
#
if (-not (Test-Path -Path "%USERPROFILE%\vimfiles\after\ftplugin\cpp.vim" -Leaf)) {
  New-Item -Value "$SOURCE\.vim\after\ftplugin\cpp.vim" -Path "%USERPROFILE%\vimfiles\after\ftplugin\cpp.vim" -ItemType HardLink;
}
if (-not (Test-Path -Path "%USERPROFILE%\vimfiles\after\ftplugin\markdown.vim" -Leaf)) {
  New-Item -Value "$SOURCE\.vim\after\ftplugin\markdown.vim" -Path "%USERPROFILE%\vimfiles\after\ftplugin\markdown.vim" -ItemType HardLink;
}
if (-not (Test-Path -Path "%USERPROFILE%\vimfiles\after\ftplugin\programming.vim" -Leaf)) {
  New-Item -Value "$SOURCE\.vim\after\ftplugin\programming.vim" -Path "%USERPROFILE%\vimfiles\after\ftplugin\programming.vim" -ItemType HardLink;
}
if (-not (Test-Path -Path "%USERPROFILE%\vimfiles\after\syntax\markdown.vim" -Leaf)) {
  New-Item -Value "$SOURCE\.vim\after\syntax\markdown.vim" -Path "%USERPROFILE%\vimfiles\after\syntax\markdown.vim" -ItemType HardLink;
}
if (-not (Test-Path -Path "%USERPROFILE%\vimfiles\coc-settings.json" -Leaf)) {
  New-Item -Value "$SOURCE\.vim\coc-settings.json" -Path "%USERPROFILE%\vimfiles\coc-settings.json" -ItemType HardLink;
}
if (-not (Test-Path -Path "%USERPROFILE%\vimfiles\_vimrc" -Leaf)) {
  New-Item -Value "$SOURCE\.vimrc" -Path "%USERPROFILE%\vimfiles\_vimrc" -ItemType HardLink;
}
