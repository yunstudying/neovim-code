" 定义一个 leader
let g:mapleader = "\<Space>"

" 使用 <Ctrl> + 箭头号快速在窗口间调整
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" 分屏操作
noremap <silent> \| :vs<CR>
noremap <silent> - :sp<CR>


" 使用 alt + 箭头号调整创建大小
noremap <a-up> :res +2<CR>
noremap <a-down> :res -2<CR>
noremap <a-left> :vertical resize-2<CR>
noremap <a-right> :vertical resize+2<CR>

" 使用 Tab 操作 Buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" 删除 Buffer 中的文件
" 定义一个删除缓存区文件的元素
function! Delete()

  " 最大缓存号
  let l:maxcur = bufnr('$')

  " 如果最大文件号不存在
  if buflisted(l:maxcur) == 0
    let l:maxcur = bufnr()
  endif

  " 总的缓冲区数量
  let l:count = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

  " 当前缓存文件号
  let l:cur = bufnr()

  " 如果缓冲区只有一个文件，则直接退出
  try
    if l:count == 1
      execute "q"
      return
    endif

    let l:cmd = "bd" . l:cur

    " 若文件列表后面还有文件，则切换列表
    if l:cur < l:maxcur
      execute "bnext"
    else
      execute "bprevious"
    endif
    execute l:cmd
  catch
    echo "No files in the buffer"
  endtry
endfunction
nnoremap <silent> q :call Delete()<CR>


" 按大写的 Ctrl + s 保存，相当于 :w
noremap <C-s> :w<CR>
inoremap <C-s> <esc>:w<CR>

" 按下 Ctrl + q 相当于 :q!
noremap <C-q> :q!<CR>

" 使用 Ctrl +c 代替 ESC 键
noremap <C-c> <ESC>


" 使用 shift + r 加载配置文件
noremap <S-r> :e ~/.config/nvim/<CR>
