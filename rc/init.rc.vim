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

if has('vim_starting')
  " Load neobundle
  let s:neobundle_dir = finddir('neobundle.vim', '.;')
  if s:neobundle_dir != ''
    execute 'set runtimepath^=' .fnamemodify(s:neobundle_dir, ':p')
  elseif &runtimepath !~ '/neobundle.vim'
    let s:neobundle_dir = expand('$CACHE/neobundle').'/neobundle.vim/'
    if !isdirectory(s:neobundle_dir)
      execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ s:neobundle_dir
    endif
    execute 'set runtimepath^=' . s:neobundle_dir
  endif
endif

call neobundle#begin(expand('$CACHE/neobundle'))

"if neobundle#load_cache()
  NeoBundleFetch 'shougo/neobundle.vim'
  " Solarized color scheme
  NeoBundle 'altercation/vim-colors-solarized'
  " show the contents of the registers on the sidebar
  NeoBundle 'junegunn/vim-peekaboo'
  " Numerous bracket mappings
"  NeoBundle 'tpope/vim-unimpaired'
  " Powerline status line plugin
  NeoBundle 'bling/vim-airline'
  " line up text according to pattern
  NeoBundle 'godlygeek/tabular'
  " syntax
  NeoBundle 'scrooloose/syntastic'
  " visual undo tree
  NeoBundle 'sjl/gundo.vim'
  " exchange text
  NeoBundle 'tommcdo/vim-exchange'
  " enhance % match
  NeoBundle 'vim-scripts/matchit.zip'
  " add visual effects to marks
  NeoBundle 'vim-scripts/ShowMarks7'
  " modify surroundings of text
  NeoBundle 'vim-scripts/surround.vim'
  " Markdown preview
  NeoBundle 'suan/vim-instant-markdown'
  " Work with latex
  NeoBundle 'vim-latex/vim-latex'
  " Tag list
  " NeoBundle 'vim-scripts/Tagbar'
  " make commenting task easier
  NeoBundle 'vim-scripts/The-NERD-Commenter'
  " search through files/buffers/MRU
  NeoBundle 'ctrlpvim/ctrlp.vim'
  " Highlight Hex color pallets
  NeoBundle 'ap/vim-css-color'
  " Unite everything
  NeoBundle 'shougo/unite.vim'
  " Unite plugins
  NeoBundle 'sgur/unite-qf'             "quickfix
  NeoBundle 'tacroe/unite-mark'         "marks
  " ====================
  " File Explorer
  NeoBundle 'shougo/vimfiler.vim'
  " snippets
  NeoBundle 'shougo/neosnippet-snippets'
  NeoBundle 'shougo/neosnippet.vim'
  " Cache based auto completion
  NeoBundle 'shougo/neoinclude.vim'
  NeoBundle 'shougo/context_filetype.vim'
  NeoBundle 'shougo/neocomplete.vim'
"  NeoBundleSaveCache
"endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

