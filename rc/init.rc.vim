"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Init
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Cache
let $CACHE = expand('~/.vim/.cache')
let $UNDO = expand('$CACHE/vim_undo')
let $VIEW = expand('$CACHE/vim_view')

if !isdirectory(expand($CACHE))
        call mkdir(expand('$CACHE', 'p'))
endif

if !isdirectory(expand($VIEW))
        call mkdir(expand('$VIEW', 'p'))
endif

if !isdirectory(expand($UNDO))
        call mkdir(expand('$UNDO', 'p'))
endif

set nocompatible
filetype off
set runtimepath^=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
" show the contents of the registers on the sidebar
Plugin 'junegunn/vim-peekaboo'
" Numerous bracket mappings
Plugin 'tpope/vim-unimpaired'
" Powerline status line plugin
Plugin 'bling/vim-airline'
" Speed up Vim by updating folds only when called-for.
Plugin 'Konfekt/FastFold.git'
" line up text according to pattern
Plugin 'godlygeek/tabular'
" syntax
Plugin 'scrooloose/syntastic'
" visual undo tree
Plugin 'sjl/gundo.vim'
" exchange text
Plugin 'tommcdo/vim-exchange'
" enhance % match
Plugin 'vim-scripts/matchit.zip'
" add visual effects to marks
Plugin 'vim-scripts/ShowMarks7'
" modify surroundings of text
Plugin 'vim-scripts/surround.vim'
" generate lorem Ipsum
Plugin 'vim-scripts/loremipsum'
" Markdown preview
Plugin 'suan/vim-instant-markdown'
" Work with latex
Plugin 'vim-latex/vim-latex'
" Tag list
Plugin 'vim-scripts/Tagbar'
" make commenting task easier
Plugin 'vim-scripts/The-NERD-Commenter'
" search through files/buffers/MRU
Plugin 'ctrlpvim/ctrlp.vim'
" Highlight Hex color pallets
Plugin 'ap/vim-css-color'

Plugin 'Valloric/YouCompleteMe'
" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'

call vundle#end()

filetype plugin indent on

