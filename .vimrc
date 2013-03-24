"Use Vi Improved
:set nocompatible

"Make backspace behave right in INSERT mode
:set backspace=indent,eol,start

"Line numbers
:set number

"Cursor position in right bottom corner
:set ruler

"Ignore case when searching
:set ignorecase

"Highlight matches
:set hlsearch

"Incremental search
:set incsearch

"Inherit indent from previous line
:set autoindent

"History setting
:set history=50

"Show commands
:set showcmd

"Show which mode I am in
:set showmode
"
"Highlight syntax
set t_Co=256
syntax on
colorscheme jellybeans 

"Word wrap
map Q gq

"Filetype plugin
filetype plugin indent on

