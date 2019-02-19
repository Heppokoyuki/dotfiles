" 適当に変えて
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

call dein#begin('~/.vim/dein')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-surround')
call dein#add('Shougo/neocomplete.vim')
call dein#add('thinca/vim-ref')
call dein#add('tomtom/tcomment_vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('altercation/vim-colors-solarized')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('vim-scripts/dbext.vim')
call dein#add('lervag/vimtex')
call dein#add('ncm2/ncm2')
call dein#add('roxma/nvim-yarp')
call dein#add('ncm2/ncm2-bufword')
call dein#add('ncm2/ncm2-path')
call dein#add('ncm2/ncm2-cssomni')
call dein#add('ncm2/ncm2-tern')
call dein#add('phpactor/ncm2-phpactor')
call dein#add('ncm2/ncm2-pyclang')
call dein#add('ncm2/ncm2-gtags')
" call dein#add('scrooloose/syntastic')
call dein#end()

if dein#check_install()
  call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

let g:powerline_pycmd="py3"
set laststatus=2

let g:python3_host_prog='/usr/bin/python3'

filetype plugin indent on
syntax on

colorscheme solarized

set encoding=utf8
set fenc=utf-8
set autoread
set hidden
set showcmd
set wildmode=list:longest
syntax enable
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
" set cursorline
set number
set noswapfile
set visualbell
set clipboard+=unnamed
set noautoindent
set nosmartindent

" NEO COMPLETE CONFIG "

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:indent_guides_enable_on_vim_startup = 1
noremap :tree :NERDTreeToggle

let g:php_baselib = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags = 1
let g:php_sql_query = 1

set ts=4 sw=4 et
let g:indent_guides_start_lecel = 2
let g:indent_guides_guide_size = 1

inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^a
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^a

" Death to the devilish cross key.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" easymotion config
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

let g:EasyMotion_do_mapping = 0

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" gtags settings
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" dbext settings
if filereadable(expand('~/.dbext_profile'))
    source ~/.dbext_profile
endif

let  g:dbext_default_history_file = '~/.dbext_history'

" vimtex settings
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex = g:vimtex#re#neocomplete
let g:latex_latexmk_options = '-pdf'

" ncm2 completion settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

