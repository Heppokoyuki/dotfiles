set runtimepath+=/home/yuki/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('/home/yuki/.vim/dein')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('justmao945/vim-clang')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-surround')
call dein#add('Shougo/neocomplete.vim')
call dein#add('thinca/vim-ref')
call dein#add('tomtom/tcomment_vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#end()

filetype plugin indent on
syntax enable

set fenc=utf-8
set autoread
set hidden
set showcmd
set wildmode=list:longest
syntax on
colorscheme molokai
set t_Co=256
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set number
set noswapfile
set visualbell

let g:indent_guides_enable_on_vim_startup = 1
map <C-n> :NERDTreeToggle<CR>
