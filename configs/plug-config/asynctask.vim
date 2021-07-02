" 执行任务时打开一个外部终端
let g:asyncrun_open = 10
let g:asynctasks_term_pos = 'bottom'

" 终端复用
let g:asynctasks_term_reuse = 1

" 分屏终端时，焦点不变
let g:asynctasks_term_focus = 0

noremap <silent> <F5> :AsyncTask  file-run <cr>
