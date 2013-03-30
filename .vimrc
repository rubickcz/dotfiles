set nocompatible "Use Vi Improved
set number "Line numbers
set ruler "Cursor position in right bottom corner
set ignorecase "Ignore case when searching
set hlsearch "Highlight matches
set incsearch "Incremental search
set autoindent "Inherit indent from previous line
set history=50 "History setting
set showcmd "Show commands
set showmode "Show which mode I am in
set mouse=a "Enable mouse

"Highlight syntax
if (&term =~ "-256color")
  set t_Co=256   
endif

syntax on
colorscheme my-jellybeans 

" Disable cursor and other keys not needed
" This is mainly for learning purpose, to start
" thinking in Vim way.s
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

map <Insert> <nop>
map <Del> <nop>
map <Home> <nop>
map <End> <nop>
map <PageUp> <nop>
map <PageDown> <nop>
