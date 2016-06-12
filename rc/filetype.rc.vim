" FileType
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable smart indent.
set autoindent smartindent

set omnifunc=syntaxcomplete#Complete

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType html       setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType vim        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType tex        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python     setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType java       setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType c,cpp      setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType sh         setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType ruby       setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType lua        setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType make       setlocal ts=8 sts=8 sw=8 noexpandtab


autocmd FileType php        setl ofu=phpcomplete#CompletePHP
autocmd FileType ruby,eruby setl ofu=rubycomplete#Complete
autocmd FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
autocmd FileType markdown   setl ofu=htmlcomplete#CompleteTags
autocmd FileType cpp        setl ofu=ccomplete#CompleteCpp
autocmd FileType css        setl ofu=csscomplete#CompleteCSS
autocmd FileType javascript setl ofu=javascriptcomplete#CompleteJS
autocmd FileType python     setl ofu=pythoncomplete#Complete
autocmd FileType xml        setl ofu=xmlcomplete#CompleteTags

  autocmd FileType python setlocal foldmethod=indent

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " Update filetype.
  autocmd BufWritePost *
        \ if &l:filetype ==# '' || exists('b:ftdetect')
        \ |   unlet! b:ftdetect
        \ |   filetype detect
        \ | endif

  " Improved include pattern.
  autocmd FileType html
        \ setlocal includeexpr=substitute(v:fname,'^\\/','','') |
        \ setlocal path+=./;/ |
        \ set ft=xml |
        \ set syntax=html

autocmd FileType vim set nofen
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

autocmd FileType c,cpp,xml  map <buffer> <leader><space> :make<cr>

endif

" Bash
let g:is_bash = 1

