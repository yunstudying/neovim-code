set tabstop=2
set autoindent
set confirm
set smartindent
set shiftwidth=2
"+++++++++++++++++++++vim-indent-line+++++++++++++++++
let g:indentLine_color_term = 100
let g:indentLine_concealcursor = '┆'
let g:indentLine_conceallevel = 2
autocmd FIletype yaml setlocal tabstop=2 softtabstop=3 shiftwidth=2 autoindent smartindent
autocmd FIletype python setlocal tabstop=4 expandtab shiftwidth=4 autoread nocompatible confirm autoindent smartindent
let g:SimpylFold_docstring_preview = 1
let g:indentLine_enabled = 0
"Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <F3> :IndentLinesToggle<CR> 
nnoremap <F4> za
