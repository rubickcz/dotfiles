" File: my-jellybeans.vim
" Author: Ondrej Kulaty aka rubick
" Description: This file is used to customize stokc jellybeans color sheme

hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/jellybeans.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-jellybeans"

hi Statement cterm=Bold
hi Normal ctermfg=white
