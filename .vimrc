" Vundle setup
"==========================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" github plugins
Bundle 'kien/ctrlp.vim' 
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'jlanzarotta/bufexplorer'

" vim.org plugins
Bundle 'a.vim'
Bundle 'taglist.vim'

" colors
Bundle 'nanotech/jellybeans.vim'
Bundle 'rubickcz/my-jellybeans'


" General settings
"==========================================================================
set nocompatible " Use Vi Improved
set number       " Show line numbers
set ruler        " Show cursor position in right bottom corner
set ignorecase   " Ignore case when searching
set hlsearch     " Highlight search matches
set incsearch    " Incremental search (search as you type)
set history=1000 " Command history size
set showcmd      " Show commands typed in normal mode in right bottom corner
set showmode     " Show which mode I am in
set mouse=a      " Enable mouse
set wildmenu     " Command line autocomplete menu (when TAB is pressed)
set path+=**     " Allow gf search in current dir recursively

" move through screen lines instead of real lines
map j gj
map k gk

" Programming settings
"==========================================================================
set softtabstop=4 " Width of tab typed in insert mode
set tabstop=4     " Width of tab marks in file
set shiftwidth=4  " Width of shift (when shifting lines, blocks...)
set cmdheight=2   " No need to press Enter twice after some commands

" set 256 colors if terminal supports it
if (&term =~ "-256color")
  set t_Co=256   
endif

" enable syntax highlighting and set color scheme
syntax on                 
colorscheme my-jellybeans 

" recognize filetype for syntax highlight, indetation etc.
filetype plugin indent on

" Load man plugin
runtime! ftplugin/man.vim

" Key mappings
map <f5> <esc>:update<cr>:make<cr>
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>

map <F11> :NERDTreeToggle<CR>
map <F12> :TlistToggle<CR>

map <C-s> :sh<CR>
map <C-p> :CtrlP<CR>

map <Leader>a :A<CR>
map <Leader>b :BufExplorer<CR>

" abbreviations (type in insert mode and press space)
ab #b /*********************************************
ab #e *********************************************/
ab #i #include
ab #d #define

" vimdiff commands for resolving Git merge conflicts
map <leader>2 :diffget 2<CR> :diffupdate<CR>
map <leader>3 :diffget 3<CR> :diffupdate<CR>
map <leader>4 :diffget 4<CR> :diffupdate<CR>

" AUTO COMMANDS
"======================================================================
" open NERDTree after vim start...
autocmd VimEnter * NERDTree
" ...and switch to file window
autocmd VimEnter * wincmd p
" close NERDTree if it's the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" change status bar color in insert mode 
if version >= 700
  au InsertEnter * hi StatusLine ctermbg=22
  au InsertLeave * hi StatusLine ctermbg=24
endif

" PLUGIN specific settings
"======================================================================
" Markdown folding disable
let g:vim_markdown_folding_disabled=1 
" Focus Tags List when opened
let g:Tlist_GainFocus_On_ToggleOpen=1
" Show Tags list on the right
let g:Tlist_Use_Right_Window=1
" Show tags only for current buffer
let g:Tlist_Show_One_File = 1
" Extensions for CtrlP
let g:ctrlp_extensions = ['tag']

" disable leader key bindings of buffer explorer
silent! nunmap <leader>bv
silent! nunmap <leader>bs

" DISABLE KEYS to force not use them 
"=======================================================================
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
