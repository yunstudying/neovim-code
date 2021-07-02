## Neovim 配置

:::tip

脚本可在 Centos 或 Debian 上使用

:::

### 部署

```bash
## 安装 gvim
bash nvim-ide.sh install

## 初始化配置
bash nvim-ide deploy
```

### Fn 快捷键

| 快捷键  | 行为         |
| ------- | ------------ |
| `F1`    | NERDTree     |
| `F2`    | 显示缩进层级 |
| `F3`    | 代码折叠     |
| `F5`    | 运行代码     |
| `F6-F9` | 浮动窗口     |
| `F12`   | Ranger       |



### 窗口调整

| 快捷键          | 行为                     |
| --------------- | ------------------------ |
| `Ctrl` + hjkl | 快速在窗口间跳转         |
| `\|`             | 垂直分屏                 |
| `_`             | 水平方向分屏             |
| `Alt` + hjkl  | 窗口大小调整             |
| `Tab`           | 向后切换 Buffer 中的文件 |
| `Shift` + `Tab` | 向前切换 Buffer 中的文件 |
| `q`             | 删除 Buffer              |



### 退出和保存

| 快捷键        | 行为                  |
| ------------- | --------------------- |
| `Shift` + `r` | 加载配置文件目录      |
| `Ctrl` + `S`  | 保存                  |
| `Ctrl` + `q`  | 退出窗口，相当于 `q!` |

### 代码

| 快捷键      | 行为             |
| ----------- | ---------------- |
| `gd`        | 列出定义列表     |
| `gr`        | 列出参考列表     |
| `gi`        | 待办事项清单     |
| `gy`        | 转至类型定义     |
| `[g`        | 向下查找提示信息 |
| `g]`        | 向上查找提示信息 |
| `alt` + `/` | 代码注释         |



### 文件查找

| 快捷键       | 行为                 |
| ------------ | -------------------- |
| `Ctrl` + `f` | 在当前目录下查找文件 |



### 空格键

直接键入 `space` 键，可以列出相关指令。


### 参考链接

- [https://www.chrisatmachine.com/neovim](https://www.chrisatmachine.com/neovim)
- [https://github.com/theniceboy/nvim/blob/master/README_cn.md](https://github.com/theniceboy/nvim/blob/master/README_cn.md)



### 插件地址

- [ployglot](https://github.com/sheerun/vim-polyglot)
- [nerdtree](https://github.com/preservim/nerdtree)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [vim-startify](https://github.com/mhinz/vim-startify)
- [onedark](https://github.com/joshdick/onedark.vim)
- [coc](https://github.com/neoclide/coc.nvim)
- [airline]('https://github.com/vim-airline/vim-airline)
- [airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [rnvimr](https://github.com/kevinhwang91/rnvimr)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [indentLine](https://github.com/Yggdroot/indentLine)
- [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)
- [asynctasks.vim](https://github.com/skywind3000/asynctasks.vim)
- [asyncextra.vim](https://github.com/skywind3000/asyncrun.extra)
- [floaterm](https://github.com/voldikss/vim-floaterm)
- [fzf](https://github.com/junegunn/fzf.vim)
- [which-key](https://github.com/liuchengxu/vim-which-key)

