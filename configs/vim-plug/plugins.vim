" 自动安装  vim-plug 插件
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.fastgit.org/junegunn/vim-plug/master/plug.vim
endif

" 安装一些基本的插件
call plug#begin('~/.config/nvim/autoload/plugged')
    " 语法检测
    Plug 'https://hub.fastgit.org/sheerun/vim-polyglot'
    " 文件目录树
    Plug 'https://hub.fastgit.org/preservim/nerdtree', { 'on': 'NERDTreeToggle'}
    " 括号自动补全
    Plug 'https://hub.fastgit.org/jiangmiao/auto-pairs'
    " nvim 启动界面
    Plug 'https://hub.fastgit.org/mhinz/vim-startify'
    " 主题
    Plug 'https://hub.fastgit.org/joshdick/onedark.vim'
    " Coc 插件
    Plug 'https://hub.fastgit.org/neoclide/coc.nvim', {'branch': 'release'}
    " Airline 插件
    Plug 'https://hub.fastgit.org/vim-airline/vim-airline'
    Plug 'https://hub.fastgit.org/vim-airline/vim-airline-themes'
    " Ranger plugin
    Plug 'https://hub.fastgit.org/kevinhwang91/rnvimr', {'do': 'make sync'}
    "注释
    Plug 'https://hub.fastgit.org/tpope/vim-commentary'
    " identLine 
    Plug 'https://hub.fastgit.org/Yggdroot/indentLine'
    " 终端
    Plug 'https://hub.fastgit.org/skywind3000/asyncrun.vim'
    Plug 'https://hub.fastgit.org/skywind3000/asyncrun.extra'
    Plug 'https://hub.fastgit.org/skywind3000/asynctasks.vim'
    Plug 'https://hub.fastgit.org/voldikss/vim-floaterm'
    " FZF
    Plug 'https://hub.fastgit.org/junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'https://hub.fastgit.org/junegunn/fzf.vim'
    Plug 'https://hub.fastgit.org/airblade/vim-rooter'
    
    " Which Key
    Plug 'https://hub.fastgit.org/liuchengxu/vim-which-key'
call plug#end()
