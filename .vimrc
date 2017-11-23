if &compatible
set nocompatible              
endif

set runtimepath+=/home/yuki/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('/home/yuki/.vim/dein')

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

call dein#end()

filetype plugin indent on
syntax enable

set fenc=utf-8
set autoread
set hidden
set showcmd
set wildmode=list:longest
syntax on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set number
set noswapfile
call dein#add('justmao945/vim-clang')
