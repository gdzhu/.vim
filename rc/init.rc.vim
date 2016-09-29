"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Init
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Cache
let $VIMDIR = expand('$HOME/.vim', 'p')
let $CACHE = $VIMDIR.'/.cache'
let $UNDO = $CACHE.'/vim_undo'
let $VIEW = $CACHE.'/vim_view'

if !isdirectory($VIEW)
  call mkdir($VIEW, 'p')
endif

if !isdirectory($UNDO)
  call mkdir($UNDO, 'p')
endif

" check if Plug is installed
let s:plugfile = $VIMDIR.'/autoload/plug.vim'
if empty(glob(s:plugfile))
  let s:giturl='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  silent exec '!curl -fLo' s:plugfile '--create-dirs' s:giturl
endif

" build YouCompleteMe according to platform" {{{
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!

  if a:info.status == 'installed' || a:info.force
    if has("unix")
      let s:uname = system("uname")
      if s:uname == "Darwin\n"
        !./install.py --clang-completer --tern-completer
      else
        !./install.py
      endif
    endif

  endif
endfunction
"}}}

call plug#begin($VIMDIR.'/bundle') "{{{
  Plug 'tpope/vim-endwise'                " helps to end certain structures automatically
  Plug 'tpope/vim-commentary'             " Comment stuff out
  Plug 'terryma/vim-expand-region'        " visually select increasingly larger regions of text
  Plug 'altercation/vim-colors-solarized' " Solarized color scheme
  Plug 'vim-airline/vim-airline-themes'   " airline themes
  Plug 'junegunn/vim-peekaboo'            " show the contents of the registers on the sidebar
  Plug 'tpope/vim-unimpaired'             " Numerous bracket mappings
  Plug 'bling/vim-airline'                " Powerline status line plugin
  Plug 'godlygeek/tabular'                " line up text according to pattern
  Plug 'scrooloose/syntastic'             " syntax
  Plug 'mattn/emmet-vim'                  " html & CSS
  Plug 'sjl/gundo.vim'                    " visual undo tree
  Plug 'tommcdo/vim-exchange'             " exchange text
  Plug 'vim-scripts/matchit.zip'          " enhance % match
  Plug 'vim-scripts/ShowMarks7'           " add visual effects to marks
  Plug 'vim-scripts/surround.vim'         " modify surroundings of text
  Plug 'vim-scripts/loremipsum'           " generate lorem Ipsum
  Plug 'vim-latex/vim-latex'              " Work with latex
  Plug 'vim-scripts/Tagbar'               " Tag list
  Plug 'Konfekt/FastFold'                 " Speed up Vim by updateing folds only when called-for
  Plug 'ctrlpvim/ctrlp.vim'               " search through files/buffers/MRU
  Plug 'ap/vim-css-color'                 " Highlight Hex color pallets
  Plug 'Valloric/YouCompleteMe',
        \ { 'do': function('BuildYCM')}
  Plug 'SirVer/ultisnips'                 " the ultimate solution for snippets in Vim
  Plug 'honza/vim-snippets'               " vim-snipmate & ultisnips default snippets
call plug#end()
" }}}

let g:plug_window="new"
if exists('s:giturl') && has('vim_starting')
  unlet s:giturl
  let $MYRC=expand($HOME.'/.vimrc', 'p')
  PlugUpdate | normal q | source $MYRC
endif
