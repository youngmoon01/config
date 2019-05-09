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

if has('termguicolors')
	set termguicolors
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
"Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'kaicataldo/material.vim'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/csapprox'
Plug '~/.fzf'
call plug#end()

"color-scheme related
colorscheme material

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
