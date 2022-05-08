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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'hdima/python-syntax'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fisadev/vim-isort'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tell-k/vim-autoflake'
Plugin 'tpope/vim-fugitive'

" --> COLORS
Plugin 'nanotech/jellybeans.vim'
Plugin 'rubickcz/my-jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"===========================================================================
" General settings
"===========================================================================
set encoding=utf8              " Edit files in UTF8
set nocompatible               " Use Vi Improved
set number                     " Show line numbers
set ruler                      " Show cursor position in right bottom corner
set ignorecase                 " Ignore case when searching
set smartcase                  " Turn on case when uppercase char is in search string
set hlsearch                   " Highlight search matches
set incsearch                  " Incremental search (search as you type)
set history=1000               " Command history size
set showcmd                    " Show commands typed in normal mode in right bottom corner
set showmode                   " Show which mode I am in
set mouse=a                    " Enable mouse
set wildmenu                   " Command line autocomplete menu (when TAB is pressed)
set wildmode=longest:full,full " first find longest common string
set path+=**                   " Allow gf search in current dir recursively
set cmdheight=2                " No need to press Enter twice after some commands
set autoindent                 " Auto indent next line according to previous line
set backspace=indent,eol,start " Backspace setting
set undofile                   " Remember undo tree even after unloading a buffer
set undodir=$HOME/.vim/undo    " where to save undo tree
set hidden                     " do not complain when buffer is not saved

set timeout                    " Timeout settings for command sequences
set timeoutlen=400
set ttimeout
set ttimeoutlen=400

set laststatus=2               " Enable status line for all windows
set scrolloff=1                " Always keep one line below/above the cursor
set sidescrolloff=5            " Always keep five characters to the left/right of the cursor
set display+=lastline          " Show last line even if it does not fit the screen (do not show @)
set autoread                   " Auto reload of file if changed outside of Vim

set softtabstop=4              " Width of tab typed in insert mode
set tabstop=4                  " Width of tab marks in file
set shiftwidth=4               " Width of shift (when shifting lines, blocks...)
set smarttab                   " Use smart tab
set expandtab                  " Expand tabs to spaces

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

" Open NerdTree
map <F11> :NERDTreeToggle<CR>
" Open Tag list
map <F12> :TlistToggle<CR>

" open shell (Ctrl-D to go back to Vim)
map <C-s> :sh<CR>
" Open CtrlP
map <C-p> :CtrlP<CR>
" Open Buffer Explorer
map <C-k> :ToggleBufExplorer<CR>

" Open alternate file (*.c/*.h)
map <Leader>a :A<CR>

" refresh ctags
map <Leader>t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" vimdiff commands for resolving Git merge conflicts
map <leader>2 :diffget 2<CR> :diffupdate<CR>
map <leader>3 :diffget 3<CR> :diffupdate<CR>
map <leader>4 :diffget 4<CR> :diffupdate<CR>

" remove search highlight
map <C-l> :nohlsearch<CR>

" map omnicomplete to CTRL-Space
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" move through screen lines instead of real lines
map j gj
map k gk

" expand current buffer path (us in cmd line)
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

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

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

function SetPythonSettings()
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=120
    set expandtab
    set autoindent
    set fileformat=unix
endfunction

function SetHTMLSettings()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set textwidth=0
    set expandtab
    set autoindent
    set fileformat=unix
endfunction

function SetCSSSettings()
    call SetHTMLSettings()
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
endfunction

"=========================================================================
" AUTO COMMANDS
"======================================================================

" open NERDTree after vim start...
autocmd VimEnter * NERDTree
" ...and switch to its window
autocmd VimEnter * wincmd p
" close NERDTree if it's the only buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" when editing vimrc, K opens Vim help instead of man page
autocmd FileType vim setlocal keywordprg=:help
" insert include guards
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" indentation for Python according to PEP8
au BufNewFile,BufRead *.py call SetPythonSettings()
au BufNewFile,BufRead *.js call SetPythonSettings()
au BufNewFile,BufRead *.sh call SetPythonSettings()
au BufNewFile,BufRead *.rst call SetPythonSettings()

" indentation for HTML & CSS
au BufNewFile,BufRead *.html call SetHTMLSettings()
au BufNewFile,BufRead *.css call SetCSSSettings()
au BufNewFile,BufRead *.less call SetCSSSettings()
au BufNewFile,BufRead *.yml call SetHTMLSettings()
au BufNewFile,BufRead *.toml call SetHTMLSettings()
au BufNewFile,BufRead *.json call SetHTMLSettings()

" Don't open doc string window when using completion
autocmd FileType python setlocal completeopt-=preview


"=========================================================================
" Other
"======================================================================

" change status bar color in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermbg=22
  au InsertLeave * hi StatusLine ctermbg=24
endif

" show text width visually
set colorcolumn=+1
highlight ColorColumn ctermbg=235


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

" Autoflake
let g:autoflake_remove_all_unused_imports=1

" Focus Tags List when opened
let g:Tlist_GainFocus_On_ToggleOpen=1
" Show Tags list on the right
let g:Tlist_Use_Right_Window=1
" Show tags only for current buffer
let g:Tlist_Show_One_File = 1
" Extensions for CtrlP
let g:ctrlp_extensions = ['tag']
" Dont limit number of file
let g:ctrlp_max_files=0

" ignore puthon pyc files
let NERDTreeIgnore = ['\.pyc$','__pycache__$']

" disable leader key bindings of buffer explorer
silent! nunmap <leader>bv
silent! nunmap <leader>bs

" use python3 for isort
let g:vim_isort_python_version = 'python3'

" Todo ignore pyc and other generated files
"
:let $PYTHONPATH .= ':_local/site-packages/'
