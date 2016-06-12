" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
" Airlinetheme
let g:airline_theme = "solarized"

" tabline enabled
let g:airline#extensions#tabline#enabled = 1
" not show buffers
let g:airline#extensions#tabline#show_buffers = 1
" display only tab number
let g:airline#extensions#tabline#tab_nr_type = 0
" not show tab type on the right of the screen
let g:airline#extensions#tabline#show_tab_type = 0
" not show close button on the right of the screen
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#excludes = ['vimfiler:"Explorer"',
      \ '[unite] - "opened-buffers"',
      \ 'Explorer',
      \ 'opened-buffers']

" enable whitespace
let g:airline#extension#whitespace#enabled = 1


""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_autoshowtag = 1
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_show_visibility = 1
let g:tagbar_expand = 1

" au BufEnter * nested :call tagbar#autoopen(0)

" " switch to main edit buffer
" autocmd VimEnter * nested sb "@%"


""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

" ShowMarksHLl : This group is used to highlight all the lowercase marks.
highlight ShowMarksHLl ctermfg=NONE ctermbg=grey cterm=bold guifg=NONE guibg=lightgrey gui=bold
" ShowMarksHLu : This group is used to highlight all the uppercase marks.
highlight ShowMarksHLu ctermfg=NONE ctermbg=blue cterm=bold guifg=NONE guibg=lightblue gui=bold
" ShowMarksHLo : This group is used to highlight all other marks.
highlight ShowMarksHLo ctermfg=NONE ctermbg=blue cterm=bold guifg=NONE guibg=lightblue gui=bold
" ShowMarksHLm : This group is used when multiple marks are on the same line.
highlight ShowMarksHLm ctermfg=NONE ctermbg=blue cterm=bold guifg=NONE guibg=lightblue gui=bold

""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""
"Basically you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

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

""""""""""""""""""""""""""""""
" Gundo setting
""""""""""""""""""""""""""""""
let g:gundo_width = 40
let g:gundo_preview_height = 15
let g:gundo_right = 1
let g:gundo_preview_bottom = 1


""""""""""""""""""""""""""""""
" exchange.vim
""""""""""""""""""""""""""""""
let g:exchange_no_mappings=1
nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

""""""""""""""""""""""""""""""
" CTRL_P
""""""""""""""""""""""""""""""

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" """"""""""""""""""""""""""""""
" " FastFold
" """"""""""""""""""""""""""""""
"
"
"     nmap <F5> <Plug>(FastFoldUpdate)
"   let g:fastfold_savehook = 1


""""""""""""""""""""""""""""""
" Vim-Latex
""""""""""""""""""""""""""""""
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
au FileType tex setlocal iskeyword+=:

let g:Tex_ViewRule_pdf = 'open -a Preview.app'


""""""""""""""""""""""""""""""
" Instant markdown
""""""""""""""""""""""""""""""
au FileType markdown setlocal shell=bash\ -i


""""""""""""""""""""""""""""""
" Snippets
""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="~"
let g:UltiSnipsJumpForwardTrigger="<S-Tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""
" Snippets
""""""""""""""""""""""""""""""
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

