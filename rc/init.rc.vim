"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Init
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Cache
let $CACHE = expand('$HOME/.vim/.cache')
let $UNDO = expand('$CACHE/vim_undo')
let $VIEW = expand('$CACHE/vim_view')

if !isdirectory(expand($VIEW))
  call mkdir(expand('$VIEW', 'p'))
endif

if !isdirectory(expand($UNDO))
  call mkdir(expand('$UNDO', 'p'))
endif

" check if Plug is installed
let s:bundledir = expand('$HOME/.vim/bundle')
let s:plugdir = expand(s:bundledir.'/vim-plug')
if !isdirectory(s:plugdir)
  let s:giturl='https://github.com/junegunn/vim-plug.git'
  silent exec '!git clone '.s:giturl s:plugdir
endif

call plug#begin(s:bundledir) "{{{
  Plug 'junegunn/vim-plug'                " Plugin manager
  Plug 'altercation/vim-colors-solarized' " Solarized color scheme
  Plug 'vim-airline/vim-airline-themes'   " airline themes
  Plug 'junegunn/vim-peekaboo'            " show the contents of the registers on the sidebar
  Plug 'tpope/vim-unimpaired'             " Numerous bracket mappings
  Plug 'bling/vim-airline'                " Powerline status line plugin
  Plug 'godlygeek/tabular'                " line up text according to pattern
  Plug 'scrooloose/syntastic'             " syntax
  Plug 'sjl/gundo.vim'                    " visual undo tree
  Plug 'tommcdo/vim-exchange'             " exchange text
  Plug 'vim-scripts/matchit.zip'          " enhance % match
  Plug 'vim-scripts/ShowMarks7'           " add visual effects to marks
  Plug 'vim-scripts/surround.vim'         " modify surroundings of text
  Plug 'vim-scripts/loremipsum'           " generate lorem Ipsum
  Plug 'suan/vim-instant-markdown'        " Markdown preview
  Plug 'vim-latex/vim-latex'              " Work with latex
  Plug 'vim-scripts/Tagbar'               " Tag list
  Plug 'Konfekt/FastFold'                 " Speed up Vim by updateing folds only when called-for
  Plug 'vim-scripts/The-NERD-Commenter'   " make commenting task easier
  Plug 'ctrlpvim/ctrlp.vim'               " search through files/buffers/MRU
  Plug 'ap/vim-css-color'                 " Highlight Hex color pallets
  Plug 'Valloric/YouCompleteMe',          " A code-completion engine for Vim
        \{ 'do': './install.py' }
  Plug 'SirVer/ultisnips'                 " the ultimate solution for snippets in Vim
        \| Plug 'honza/vim-snippets'      " vim-snipmate & ultisnips default snippets
call plug#end()
" }}}

let g:plug_window="new"
if exists('s:giturl') && s:giturl
  unlet s:giturl
  autocmd VimEnter * PlugUpdate 
        \| source expand('$HOME/.vimrc')
endif
