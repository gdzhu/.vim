"----------------------------------------------------------------------------
if &compatible
    set nocompatible
endif

function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

" Neobundle and plugins init
call s:source_rc('init.rc.vim')

" Load functions
call s:source_rc('functions.rc.vim')

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Setup GUI
call s:source_rc('gui.rc.vim')

" Setup View
call s:source_rc('view.rc.vim')

" Setup Editing envrionment
call s:source_rc('edit.rc.vim')

" Setup key mappings
call s:source_rc('mapping.rc.vim')

" Setup plugins
call s:source_rc('plugins.rc.vim')

" Setup filetype related
call s:source_rc('filetype.rc.vim')


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " cscope setting
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if has("cscope")
"   set csprg=/usr/bin/cscope
"   set csto=1
"   set cst
"   set nocsverb
"   " add any database in current directory
"   if filereadable("cscope.out")
"       cs add cscope.out
"   endif
"   set csverb
" endif
"
" nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast grep
nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
vmap <silent> <leader>lv :lv /<c-r>=<sid>GetVisualSelection()<cr>/ %<cr>:lw<cr>
