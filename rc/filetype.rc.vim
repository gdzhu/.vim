" FileType
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable smart indent.
set autoindent smartindent

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customizations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType c,cpp setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType tex setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Enable omni completion.
autocmd FileType c setlocal omnifunc=
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable syntax
autocmd Filetype *
      \if &omnifunc == "" |
      \  setlocal omnifunc=syntaxcomplete#Complete |
      \endif

autocmd FileType python setlocal foldmethod=indent

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

autocmd FileType php setlocal path+=/usr/local/share/pear

autocmd FileType apache setlocal path+=./;/

autocmd FileType go highlight default link goErr WarningMsg |
      \ match goErr /\<err\>/


" PHP
let g:php_folding = 0

" Python
let g:python_highlight_all = 1

" XML
let g:xml_syntax_folding = 1

" Vim
let g:vimsyntax_noerror = 1
"let g:vim_indent_cont = 0
autocmd FileType vim set nofen
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

" Bash
let g:is_bash = 1

" Java
let g:java_highlight_functions = 'style'
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1

" JavaScript
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" Markdown
let g:markdown_fenced_languages = []

" Go
if $GOROOT != ''
  set runtimepath+=$GOROOT/misc/vim
endif

autocmd FileType c,cpp,xml  map <buffer> <leader><space> :make<cr>

""""""""""""""""""""""""""""""
" HTML related
""""""""""""""""""""""""""""""
" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1

"To HTML
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1


