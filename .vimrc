syntax on
sy enable
set t_Co=256
set t_ut=
set nocp
set ts=2
set sw=2
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
set backspace=indent,eol,start
set history=1000
set iskeyword-=_
set iskeyword-=-
set tags+=./tags/,tags
set tags+=/usr/include/tags
filetype on
filetype plugin on
set mouse=a
set encoding=utf-8

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

"Plugin settings
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug setting
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/csapprox'
Plug '~/.fzf'
call plug#end()

"color-scheme related
colorscheme onedark

"nerd tree
map <C-\> :NERDTreeFind <CR>

"YouCompleteMe configuration
let g:ycm_autoclose_preview_window_after_completion = 1
let g:syntastic_java_checkers = []

map <C-/> :YcmCompleter GoToDeclaration <CR>

hi YcmErrorSection ctermfg=255 ctermbg=167 guibg=#804040 guifg=#ffffff
hi YcmErrorSign ctermfg=255 ctermbg=167 guibg=#804040 guifg=#ffffff
hi YcmWarningSection cterm=NONE ctermbg=58 guibg=#404020
hi YcmWarningSign ctermfg=251 ctermbg=58 guibg=#404020
hi Pmenu ctermfg=237 ctermbg=111
hi PmenuSel ctermfg=111 ctermbg=237

"fzf configuration
map <C-f> <Nop>
map <C-f> :FZF <CR>
