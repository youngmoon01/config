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
set expandtab
set autoindent
set nu
set ru
set magic
set nuw=5
set ls=2
set backspace=indent,eol,start
set history=1000
filetype on
filetype plugin on
set mouse=a
set encoding=utf-8

if has("termguicolors")
  set termguicolors
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
Plug 'scrooloose/nerdtree'
Plug 'sainnhe/everforest'
Plug 'sheerun/vim-polyglot'
Plug 'chaoren/vim-wordmotion'
Plug 'neovim/nvim-lspconfig'
Plug 'wbthomason/packer.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug '~/.fzf' " uncomment this after building fzf
call plug#end()

"color-scheme related
set background=dark
colorscheme everforest

"nerd tree
map <C-\> :NERDTreeFind <CR>

"fzf configuration
map <C-f> <Nop>
map <C-f> :FZF <CR>

" remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')
