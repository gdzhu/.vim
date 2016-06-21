"----------------------------------------------------------------------------
scriptencoding utf-8
set encoding=utf-8

if &compatible
    set nocompatible
endif

function! s:sourcerc(path)
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

" Neobundle and plugins init
call s:sourcerc('init.rc.vim')

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Setup GUI
call s:sourcerc('gui.rc.vim')

" Setup View
call s:sourcerc('view.rc.vim')

" Setup Editing envrionment
call s:sourcerc('edit.rc.vim')

" Setup key mappings
call s:sourcerc('mapping.rc.vim')

" Setup plugins
call s:sourcerc('plugins.rc.vim')

" Setup filetype related
call s:sourcerc('filetype.rc.vim')

" Load functions
call s:sourcerc('functions.rc.vim')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> :mksession! $CACHE/vim_session <cr> " Quick write session with F2
map <F5> :source $CACHE/vim_session <cr>     " And load session with F3
" Switch between Hex and normal mode
noremap <F8> <Esc>:call HexMe()<CR>
nmap <F12> <Esc>:!ctags -R *<CR>
