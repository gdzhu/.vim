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
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'vim-scripts/Marks-Browser'
  NeoBundle 'vim-scripts/matchit.zip'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'vim-scripts/ShowMarks7'
  NeoBundle 'vim-scripts/surround.vim'
  NeoBundle 'vim-scripts/Tagbar'
  NeoBundle 'vim-scripts/The-NERD-Commenter'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'shougo/unite.vim'
  NeoBundle 'shougo/vimfiler.vim'
  NeoBundle 'shougo/neosnippet-snippets'
  NeoBundle 'shougo/neosnippet.vim'
  NeoBundle 'shougo/neoinclude.vim'
  NeoBundle 'shougo/context_filetype.vim'
  NeoBundle 'shougo/neocomplete.vim'
  NeoBundle 'shougo/vinarise.vim'
  NeoBundle 'Shougo/vimproc.vim', {
                  \ 'build' : {
                  \     'windows' : 'tools\\update-dll-mingw',
                  \     'cygwin' : 'make -f make_cygwin.mak',
                  \     'mac' : 'make -f make_mac.mak',
                  \     'unix' : 'make -f make_unix.mak',
                  \    },
                  \ }
"  NeoBundleSaveCache
"endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc
  call neobundle#call_hook('on_source')
endif
