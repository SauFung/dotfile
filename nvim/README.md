# SleepVim Manual

## 依赖
- Windows: mingw64 / mingw32-make / gcc
- Linux: make / gcc / clangd
- node / yarn (nvm)
- git
- Nerd Font
- [im-select](https://github.com/daipeihust/im-select/blob/master/win/out/x64/im-select.exe)（仅 Windows 或 WSL）
- [win32yank](https://github.com/equalsraf/win32yank/releases/latest)（仅 WSL）
> 下载汇总：<https://github.com/SauFung/dotfile/releases>


程序路径修改：`./lua/config/misc.lua`
- im-select 路径：`M.im_select`
- win32yank 路径：`M.win32yank`
- Windows 下的 clangd 路径：`M.clangd_path`

## nvim-surround
- 定义字符串包围（括号）
前缀：
- `ys`：新增
- `ds`：删除
- `cs`：修改



