# Create directories
#
if (-not (Test-Path -Path "$env:USERPROFILE\vimfiles\after\ftplugin" -PathType Container)) {
  New-Item -Path "$env:USERPROFILE\vimfiles\after\ftplugin" -ItemType Directory;
}
if (-not (Test-Path -Path "$env:USERPROFILE\vimfiles\after\syntax" -PathType Container)) {
  New-Item -Path "$env:USERPROFILE\vimfiles\after\syntax" -ItemType Directory;
}

# Source script directory
#
$SOURCE=$PSScriptRoot

# Link files from the repository
#
if (Test-Path -Path "$env:USERPROFILE\vimfiles\after\ftplugin\ps1.vim" -PathType Leaf) {
  Remove-Item -Path "$env:USERPROFILE\vimfiles\after\ftplugin\ps1.vim" -Force;
}
if (Test-Path -Path "$env:USERPROFILE\vimfiles\after\ftplugin\cpp.vim" -PathType Leaf) {
  Remove-Item -Path "$env:USERPROFILE\vimfiles\after\ftplugin\cpp.vim" -Force;
}
if (Test-Path -Path "$env:USERPROFILE\vimfiles\after\ftplugin\markdown.vim" -PathType Leaf) {
  Remove-Item -Path "$env:USERPROFILE\vimfiles\after\ftplugin\markdown.vim" -Force;
}
if (Test-Path -Path "$env:USERPROFILE\vimfiles\after\ftplugin\programming.vim" -PathType Leaf) {
  Remove-Item -Path "$env:USERPROFILE\vimfiles\after\ftplugin\programming.vim" -Force;
}
if (Test-Path -Path "$env:USERPROFILE\vimfiles\after\syntax\markdown.vim" -PathType Leaf) {
  Remove-Item -Path "$env:USERPROFILE\vimfiles\after\syntax\markdown.vim" -Force;
}
if (Test-Path -Path "$env:USERPROFILE\vimfiles\coc-settings.json" -PathType Leaf) {
  Remove-Item -Path "$env:USERPROFILE\vimfiles\coc-settings.json" -Force;
}
if (Test-Path -Path "$env:USERPROFILE\vimfiles\vimrc" -PathType Leaf) {
  Remove-Item -Path "$env:USERPROFILE\vimfiles\vimrc" -Force;
}
New-Item -Value "$SOURCE\.vimrc" -Path "$env:USERPROFILE\vimfiles\vimrc" -ItemType HardLink;
New-Item -Value "$SOURCE\.vim\coc-settings.json" -Path "$env:USERPROFILE\vimfiles\coc-settings.json" -ItemType HardLink;
New-Item -Value "$SOURCE\.vim\after\syntax\markdown.vim" -Path "$env:USERPROFILE\vimfiles\after\syntax\markdown.vim" -ItemType HardLink;
New-Item -Value "$SOURCE\.vim\after\ftplugin\programming.vim" -Path "$env:USERPROFILE\vimfiles\after\ftplugin\programming.vim" -ItemType HardLink;
New-Item -Value "$SOURCE\.vim\after\ftplugin\markdown.vim" -Path "$env:USERPROFILE\vimfiles\after\ftplugin\markdown.vim" -ItemType HardLink;
New-Item -Value "$SOURCE\.vim\after\ftplugin\cpp.vim" -Path "$env:USERPROFILE\vimfiles\after\ftplugin\cpp.vim" -ItemType HardLink;
New-Item -Value "$SOURCE\.vim\after\ftplugin\ps1.vim" -Path "$env:USERPROFILE\vimfiles\after\ftplugin\ps1.vim" -ItemType HardLink;
