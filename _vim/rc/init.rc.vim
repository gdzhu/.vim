"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Init
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Cache
let $CACHE = expand('~/.vim/.cache')
if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

if has('vim_starting') "{{{
  " Load neobundle
  let s:neobundle_dir = finddir('neobundle.vim', '.;')
  if s:neobundle_dir != ''
    execute 'set runtimepath^=' .fnamemodify(s:neobundle_dir, ':p')
  elseif &runtimepath !~ '/neobundle.vim'
    let s:neobundle_dir = expand('$CACHE/neobundle').'/neobundle.vim'

    if !isdirectory(s:neobundle_dir)
      execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ s:neobundle_dir
    endif

    execute 'set runtimepath^=' . s:neobundle_dir
  endif
endif
"}}}

call neobundle#begin(expand('$CACHE/neobundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

if neobundle#load_cache()
  NeoBundleFetch 'shougo/neobundle.vim'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'Marks-Browser'
  NeoBundle 'matchit.zip'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'ShowMarks'
  NeoBundle 'surround.vim'
  NeoBundle 'Tagbar'
  NeoBundle 'The-NERD-Commenter'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'shougo/unite.vim'
  NeoBundle 'shougo/vimfiler.vim'
  NeoBundle 'shougo/neosnippet-snippets'
  NeoBundle 'shougo/neosnippet.vim'
  NeoBundle 'shougo/neoinclude.vim'
  NeoBundle 'shougo/context_filetype.vim'
  NeoBundle 'shougo/neocomplete.vim'
  NeoBundle 'shougo/vinarise.vim'
  NeoBundleSaveCache
endif

call neobundle#end()

filetype plugin indent on
syntax enable

NeoBundleCheck
