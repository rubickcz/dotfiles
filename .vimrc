"==========================================================================
" Vundle setup
"==========================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" --> GITHUB PLUGINS 
Plugin 'kien/ctrlp.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-sensible'
"Plugin 'bling/vim-airline'
"Plugin 'tpope/vim-fugitive'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'bling/vim-airline'
"Plugin 'Rip-Rip/clang_complete'

" --> VIM.ORG PLUGINS
Plugin 'a.vim'
Plugin 'taglist.vim'

" --> COLORS
Plugin 'nanotech/jellybeans.vim'
Plugin 'rubickcz/my-jellybeans'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"===========================================================================
" General settings
"===========================================================================
set nocompatible               " Use Vi Improved
set number                     " Show line numbers
set ruler                      " Show cursor position in right bottom corner
set ignorecase                 " Ignore case when searching
set hlsearch                   " Highlight search matches
set incsearch                  " Incremental search (search as you type)
set history=1000               " Command history size
set showcmd                    " Show commands typed in normal mode in right bottom corner
set showmode                   " Show which mode I am in
set mouse=a                    " Enable mouse
set wildmenu                   " Command line autocomplete menu (when TAB is pressed)
set wildmode=longest:full,full " first find longest common string
set path+=**                   " Allow gf search in current dir recursively
set cmdheight=2				   " No need to press Enter twice after some commands
set autoindent			       " Auto indent next line according to previous line	
set backspace=indent,eol,start " Backspace setting

set timeout
set timeoutlen=400
set ttimeout
set ttimeoutlen=400
set laststatus=2
set scrolloff=1
set sidescrolloff=5
set display+=lastline
set autoread

set softtabstop=4              " Width of tab typed in insert mode
set tabstop=4                  " Width of tab marks in file
set shiftwidth=4               " Width of shift (when shifting lines, blocks...)
set smarttab				   " User smart tab
set expandtab

" enable syntax highlighting and set color scheme
syntax enable 
colorscheme my-jellybeans 

" Load man plugin
runtime! ftplugin/man.vim

"=========================================================================
" Key mappings
"=========================================================================

" Save the current file and make
map <f5> <esc>:update<cr>:make<cr>

" Next and previous compile error
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>

map <F10> :GundoToggle<CR>
map <F11> :NERDTreeToggle<CR>
map <F12> :TlistToggle<CR>

" open shell (Ctrl-D to go back to Vim)
map <C-s> :sh<CR>

map <C-p> :CtrlP<CR>
map <C-k> :ToggleBufExplorer<CR>
map <Leader>a :A<CR>

" refresh ctags
map <Leader>t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" vimdiff commands for resolving Git merge conflicts
map <leader>2 :diffget 2<CR> :diffupdate<CR>
map <leader>3 :diffget 3<CR> :diffupdate<CR>
map <leader>4 :diffget 4<CR> :diffupdate<CR>

" remove search highlight
map <C-l> :nohlsearch<CR>
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" move through screen lines instead of real lines
map j gj
map k gk

"=========================================================================
" Abbreviations (type in insert mode and press space)
"=========================================================================

ab #b /*********************************************
ab #e *********************************************/
ab #i #include
ab #d #define

"=========================================================================
" Functions
"=========================================================================

" add include guards to new header files
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  execute "normal! O"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

"=========================================================================
" AUTO COMMANDS
"======================================================================

" open NERDTree after vim start...
autocmd VimEnter * NERDTree
" ...and switch to its window
autocmd VimEnter * wincmd p
" close NERDTree if it's the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"=========================================================================
" Other
"======================================================================

" change status bar color in insert mode 
if version >= 700
  au InsertEnter * hi StatusLine ctermbg=22
  au InsertLeave * hi StatusLine ctermbg=24
endif

" Disable arrow keys to learn the Vim way
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

"=========================================================================
" PLUGIN specific settings
"======================================================================

let g:gundo_right = 1

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

"let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_confirm_extra_conf = 0
"let g:ycm_show_diagnostics_ui = 0

" disable leader key bindings of buffer explorer
silent! nunmap <leader>bv
silent! nunmap <leader>bs

autocmd FileType html setlocal shiftwidth=2 tabstop=2
