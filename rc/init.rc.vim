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

" Required:
set runtimepath^=~/.vim/.cache/bundle/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('$CACHE/bundle'))

" Let dein manage dein
" Required:
call dein#add( 'Shougo/dein.vim' )

" Solarized color scheme
call dein#add( 'altercation/vim-colors-solarized' )
call dein#add( 'vim-airline/vim-airline-themes' )
" show the contents of the registers on the sidebar
call dein#add( 'junegunn/vim-peekaboo' )
" Numerous bracket mappings
call dein#add( 'tpope/vim-unimpaired' )
" Powerline status line plugin
call dein#add( 'bling/vim-airline' )
" Speed up Vim by updating folds only when called-for.
call dein#add( 'Konfekt/FastFold.git' )
" line up text according to pattern
call dein#add( 'godlygeek/tabular' )
" syntax
call dein#add( 'scrooloose/syntastic' )
" visual undo tree
call dein#add( 'sjl/gundo.vim' )
" exchange text
call dein#add( 'tommcdo/vim-exchange' )
" enhance % match
call dein#add( 'vim-scripts/matchit.zip' )
" add visual effects to marks
call dein#add( 'vim-scripts/ShowMarks7' )
" modify surroundings of text
call dein#add( 'vim-scripts/surround.vim' )
" generate lorem Ipsum
call dein#add( 'vim-scripts/loremipsum' )
" Markdown preview
call dein#add( 'suan/vim-instant-markdown' )
" Work with latex
call dein#add( 'vim-latex/vim-latex' )
" Tag list
call dein#add( 'vim-scripts/Tagbar' )
" make commenting task easier
call dein#add( 'vim-scripts/The-NERD-Commenter' )
" search through files/buffers/MRU
call dein#add( 'ctrlpvim/ctrlp.vim' )
" Highlight Hex color pallets
call dein#add( 'ap/vim-css-color' )

call dein#end()

filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
        call dein#install()
endif
