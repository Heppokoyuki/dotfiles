call plug#begin('~/.vim/plugged')
Plug 'ziglang/zig.vim'
Plug 'vim-scripts/verilog.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
call plug#end()

syntax on
filetype on
set expandtab
set bs=2
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smartcase
set ignorecase
set nocompatible
set encoding=utf-8
set hlsearch
set history=500
set t_Co=256
set tabpagemax=500
set ruler
set nojoinspaces
set shiftround
set number
set tw=0
set belloff=all

nmap <Leader>t :FZF<CR>
nmap <Leader>h :Ag<CR>
nmap <F8> :TagbarToggle<CR>

au BufRead,BufNewFile *.zen set filetype=zig

" If there is .vimrc.local file in the project, it will loaded and ALE will
" know the include paths.
augroup vimrc-local
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
    let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
        source `=i`
    endfor
endfunction

" https://github.com/ggreer/the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_c_parse_makefile = 1


