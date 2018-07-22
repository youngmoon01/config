syntax on
sy enable
set t_Co=256
set t_ut=
set nocp
set ts=4
set sw=4
set sts=0
set nows
set hls
set cursorline
set incsearch
set noexpandtab
set autoindent
set nu
set ru
set magic
set nuw=5
set ls=2
set esckeys
set backspace=indent,eol,start
set history=1000
set iskeyword-=_
set tags+=./tags/,tags
set tags+=/usr/include/tags
filetype on
filetype plugin on
set mouse=a

colorscheme youngmoon

" remember the last cursor location of the file
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

"django syntax highlight
au BufNewFile,BufRead *.html set filetype=htmldjango

"Syntax sink
noremap <F5> <Esc>:syntax sync fromstart<CR>
inoremap <F5> <C-o>:syntax sync fromstart<CR>

"Tab-related key bindings
map <C-c> <Nop> "disable default
map <C-w><C-n> <Nop> "disable default
map <C-w>n <Nop> "disable default
noremap <C-w><C-c> :tabnew<CR>
noremap <C-w>c :tabnew<CR>
noremap <C-w><C-n> gt
noremap <C-w>n gt
noremap <C-w><C-p> gT
noremap <C-w>p gT

"Disable S-k(Shift + k) for visual mode
map <S-k> <Nop>

"Web development specific
let html_use_css=1


"modeline settings for txtfmt plugin
set modeline
set modelines=5

"javacomplete2 settings
set completeopt+=noinsert
set completeopt+=menuone
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_LibsPath = '/home/youngmoon01/TeraZerg/include/bwmirror_v2_5.jar'
let g:JavaComplete_JavaviDebug = 1
let g:JavaComplete_JavaviLogfileDirectory = '/home/youngmoon01/log'
"let g:JavaComplete_SourcesPath = '/home/youngmoon01/TeraZerg/src/main/TeraZerg.java'

"vim-plug setting
call plug#begin('~/.vim/plugged')
Plug 'artur-shaik/vim-javacomplete2'
call plug#end()
