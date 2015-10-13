" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" neocomplete
""""""""""""""""""""""""""""""
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#disable_auto_complete = 0

  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_camel_case = 1

  " Use fuzzy completion.
  let g:neocomplete#enable_fuzzy_completion = 1

  " Set auto completion length.
  let g:neocomplete#auto_completion_start_length = 2
  " Set manual completion length.
  let g:neocomplete#manual_completion_start_length = 0
  " Set minimum keyword length.
  let g:neocomplete#min_keyword_length = 3

  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#enable_cursor_hold_i = 0

  let g:neocomplete#enable_auto_delimiter = 1
  let g:neocomplete#disable_auto_select_buffer_name_pattern =
        \ '\[Command Line\]'
  let g:neocomplete#max_list = 100
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
  endif
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#enable_auto_close_preview = 1

  " Define keyword pattern.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  let g:neocomplete#keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::\w*'
  let g:neocomplete#keyword_patterns.rst =
        \ '\$\$\?\w*\|[[:alpha:]_.\\/~-][[:alnum:]_.\\/~-]*\|\d\+\%(\.\d\+\)\+'

  let g:neocomplete#ignore_source_files = []

  let g:neocomplete#sources#vim#complete_functions = {
        \ 'Ref' : 'ref#complete',
        \ 'Unite' : 'unite#complete_source',
        \ 'VimFiler' : 'vimfiler#complete',
        \ 'Vinarise' : 'vinarise#complete',
        \}
  " call neocomplete#custom#source('look', 'min_pattern_length', 4)
  " call neocomplete#custom#source('_', 'sorters', [])

  " mappings."{{{
  " <C-f>, <C-b>: page move.
  inoremap <expr><C-f>  pumvisible() ? "\<PageDown>" : "\<Right>"
  inoremap <expr><C-b>  pumvisible() ? "\<PageUp>"   : "\<Left>"
  " <C-y>: paste.
  inoremap <expr><C-y>  pumvisible() ? neocomplete#close_popup() :  "\<C-r>\""
  " <C-e>: close popup.
  inoremap <expr><C-e>  pumvisible() ? neocomplete#cancel_popup() : "\<End>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr> <BS> neocomplete#smart_close_popup()."\<C-h>"
  " <C-n>: neocomplete.
  " inoremap <expr> <C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
  " inoremap <expr> <C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
  " <C-p>: keyword completion.
  inoremap <expr> <C-p>  pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
  " inoremap <expr> '  pumvisible() ? neocomplete#close_popup() : "'"

  inoremap <silent><expr> <C-x><C-f>
        \ neocomplete#start_manual_complete('file')

  inoremap <expr> <C-g>     neocomplete#undo_completion()
  inoremap <expr> <C-l>     neocomplete#complete_common_string()
"}}}
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
  endfunction

  " <TAB>: completion.
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}
  " <S-TAB>: completion back.
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

  let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]


""""""""""""""""""""""""""""""
" neosnippet
""""""""""""""""""""""""""""""
  " smap <silent>L     <Plug>(neosnippet_jump_or_expand)
  " xmap <silent>L     <Plug>(neosnippet_start_unite_snippet_target)
  " imap <silent><S-Tab>     <Plug>(neosnippet_expand_or_jump)
  " smap <silent>K     <Plug>(neosnippet_expand_or_jump)
  " imap <silent>G     <Plug>(neosnippet_expand)
  " imap <silent><S-Tab>     <Plug>(neosnippet_start_unite_snippet)
  " xmap <silent>o     <Plug>(neosnippet_register_oneshot_snippet)
  " xmap <silent>U     <Plug>(neosnippet_expand_target)

  " imap <expr><silent>L     neocomplete#mappings#close_popup() .
  "       \ "\<Plug>(neosnippet_jump_or_expand)"

  let g:neosnippet#snippets_directory = '~/.vim/snippets'
  let g:neosnippet#data_directory='~/.vim/snippets/'


""""""""""""""""""""""""""""""
" vinarise
""""""""""""""""""""""""""""""
  " Barely useable
  " let g:vinarise_enable_auto_detect = 1
  " nnoremap <F8> :Vinarise -split-command="vsplit" <CR>


""""""""""""""""""""""""""""""
" unite
""""""""""""""""""""""""""""""
  nnoremap <silent> [Window]b :Unite -start-insert buffer -buffer-name="opened-buffers" -immediately<CR>


""""""""""""""""""""""""""""""
" vimfiler
""""""""""""""""""""""""""""""
  " noremap <silent>    [Window]s :<C-u>VimFilerBufferDir -buffer-name="Explorer"
  "                         \ -invisible -force-quit<CR>
  nnoremap <silent>   [Window]s   :<C-u>VimFilerExplorer -horizontal -auto-cd
                          \ -status -parent -find -force-quit<CR>
  let g:vimfiler_safe_mode_by_default = 0
  let g:vimfiler_enable_clipboard = 0
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '▾'
  let g:vimfiler_tree_closed_icon = '▸'
  let g:vimfiler_file_icon = ' '
  let g:vimfiler_readonly_file_icon = '✗'
  let g:vimfiler_marked_file_icon = '✓'

  call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ })
""""""""""""""""""""""""""""""
" matchit
""""""""""""""""""""""""""""""
  function! neobundle#hooks.on_post_source(bundle)
    silent! execute 'doautocmd Filetype' &filetype
  endfunction

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
  nmap <F12> <Esc>:!ctags -R *<CR>
  " let g:tagbar_ctags_bin = '/usr/bin/ctags'
  " let g:tagbar_autoshowtag = 1
  " let g:tagbar_width = 30
  " let g:tagbar_compact = 1
  " let g:tagbar_show_visibility = 1
  " let g:tagbar_expand = 1

  " au BufEnter * nested :call tagbar#autoopen(0)

  " " switch to main edit buffer
  " autocmd VimEnter * nested sb "@%"


""""""""""""""""""""""""""""""
" unite-mark
""""""""""""""""""""""""""""""
  nmap <silent> <leader>mk :<C-u>Unite  mark<cr>

""""""""""""""""""""""""""""""
" unite-quickfix
""""""""""""""""""""""""""""""
  nmap <silent> <leader>qf :<C-u>Unite  qf<cr>
  nmap <silent> <leader>ll :<C-u>Unite  locationlist<cr>


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
" Tabularize
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" exchange.vim
""""""""""""""""""""""""""""""
let g:exchange_no_mappings=1
nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

