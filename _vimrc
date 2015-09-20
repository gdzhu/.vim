"----------------------------------------------------------------------------
if &compatible
    set nocompatible
endif

function! Source_rc_file(path)
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

" Neobundle and plugins init
call Source_rc_file('init.rc.vim')

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Setup GUI
call Source_rc_file('gui.rc.vim')

" Setup View
call Source_rc_file('view.rc.vim')

" Setup Editing envrionment
call Source_rc_file('edit.rc.vim')

" Setup key mappings
call Source_rc_file('mapping.rc.vim')

" Setup plugins
call Source_rc_file('plugins.rc.vim')

" Setup filetype related
call Source_rc_file('filetype.rc.vim')

" Load functions
call Source_rc_file('functions.rc.vim')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

