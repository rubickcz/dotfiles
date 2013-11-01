set nocompatible "Use Vi Improved
set number "Line numbers
set ruler "Cursor position in right bottom corner
set ignorecase "Ignore case when searching
set hlsearch "Highlight matches
set incsearch "Incremental search
"set autoindent "Inherit indent from previous line
set history=1000 "History setting
set showcmd "Show commands
set showmode "Show which mode I am in
set mouse=a "Enable mouse
set wildmenu "Autocomplete menu

" move through screen lines
:map j gj
:map k gk

"Programming TODO: look on these more!
set softtabstop=4
set expandtab
set tabstop=4
set shiftwidth=4
filetype plugin indent on

"Highlight syntax
if (&term =~ "-256color")
  set t_Co=256   
endif

syntax on
colorscheme my-jellybeans 

" Pathogen plugin
execute pathogen#infect()

" For easier work with clipboard register
map <F12> "+
" Toggle Nerd tree
map <F11> :NERDTreeToggle<CR>

" make hjkl movements accessible from insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" Disable cursor and other keys not needed
" This is mainly for learning purpose, to start
" thinking in Vim way.
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

