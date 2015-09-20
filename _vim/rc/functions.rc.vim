" Toggle options. "{{{
function! ToggleOption(option_name)
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction
"}}}


" Toggle variables. "{{{
function! ToggleVariable(variable_name)
  if eval(a:variable_name)
    execute 'let' a:variable_name.' = 0'
  else
    execute 'let' a:variable_name.' = 1'
  endif
  echo printf('%s = %s', a:variable_name, eval(a:variable_name))
endfunction
"}}}


" Change current directory. "{{{
function! g:cd_buffer_dir()
  let filetype = getbufvar(bufnr('%'), '&filetype')
  if filetype ==# 'vimfiler'
    let dir = getbufvar(bufnr('%'), 'vimfiler').current_dir
  elseif filetype ==# 'vimshell'
    let dir = getbufvar(bufnr('%'), 'vimshell').save_dir
  else
    let dir = isdirectory(bufname('%')) ?
          \ bufname('%') : fnamemodify(bufname('%'), ':p:h')
  endif
  execute 'lcd' fnameescape(dir)
endfunction
"}}}


" Buffer related "{{{
" close buffers smartly "{{{
function! g:smart_close()
  if winnr('$') != 1
    close
  else
    call s:alternate_buffer()
  endif
endfunction
"}}}

" move to the next window "{{{
function! NextWindow()
  if winnr('$') == 1
    silent! normal! ``z.
  else
    wincmd w
  endif
endfunction
"}}}

" next window or tab "{{{
function! NextWindowOrTab()
  if tabpagenr('$') == 1 && winnr('$') == 1
    call g:split_nicely()
  elseif winnr() < winnr("$")
    wincmd w
  else
    tabnext
    1wincmd w
  endif
endfunction
"}}}

" previous window or tab "{{{
function! PreviousWindowOrTab()
  if winnr() > 1
    wincmd W
  else
    tabprevious
    execute winnr("$") . "wincmd w"
  endif
endfunction
"}}}

" split nicely "{{{
function! g:split_nicely()
  " Split nicely.
  if winwidth(0) > 2 * &winwidth
    vsplit
  else
    split
  endif
  wincmd p
endfunction
"}}}

" Delete current buffer. "{{{
function! CustomBufferDelete(is_force)
  let current = bufnr('%')

  call s:alternate_buffer()

  if a:is_force
    silent! execute 'bdelete! ' . current
  else
    silent! execute 'bdelete ' . current
  endif
endfunction
"}}}

" alternate buffer "{{{
function! s:alternate_buffer()
  let listed_buffer_len = len(filter(range(1, bufnr('$')),
        \ 's:buflisted(v:val) && getbufvar(v:val, "&filetype") !=# "unite"'))
  if listed_buffer_len <= 1
    enew
    return
  endif

  let cnt = 0
  let pos = 1
  let current = 0
  while pos <= bufnr('$')
    if s:buflisted(pos)
      if pos == bufnr('%')
        let current = cnt
      endif

      let cnt += 1
    endif

    let pos += 1
  endwhile

  if current > cnt / 2
    bprevious
  else
    bnext
  endif
endfunction
"}}}

" return buffer listed  "{{{
function! s:buflisted(bufnr)
  return exists('t:unite_buffer_dictionary') ?
        \ has_key(t:unite_buffer_dictionary, a:bufnr) && s:buflisted(a:bufnr) :
        \ s:buflisted(a:bufnr)
endfunction"}}}
"}}}
"}}}
" e: Change basic commands

" Remove trailing white spaces  "{{{
func! DeleteTrailingWS()
  let l:winview = winsaveview()
  %s/[ \t]\+$//ge
  call winrestview(l:winview)
endfunc
"}}}


" Quickfix  "{{{
function! g:toggle_quickfix_window()
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
    copen
    setlocal nowrap
    setlocal whichwrap=b,s
  endif
endfunction
" }}}


" lookup file with ignore case "{{{
function! LookupFile_IgnoreCaseFunc(pattern)
  let _tags = &tags
  try
    let &tags = eval(g:LookupFile_TagExpr)
    let newpattern = '\c' . a:pattern
    let tags = taglist(newpattern)
  catch
    echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
    return ""
  finally
    let &tags = _tags
  endtry

  " Show the matches for what is typed so far.
  let files = map(tags, 'v:val["filename"]')
  return files
endfunction
" }}}


"A function that inserts links & anchors on a TOhtml export. "{{{
" Notice:
" Syntax used is:
" Link
" Anchor
function! SmartTOHtml()
  TOhtml
  try
    %s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
    %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
    %s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
  catch
  endtry
  exe ":write!"
  exe ":bd"
endfunction
" }}}


" look-up file by visual selection "{{{
function! GetVisualSelection()
  let save_a = @a
  silent normal! gv"ay
  let v = @a
  let @a = save_a
  let var = escape(v, '\\/.$*')
  return var
endfunction
"}}}


" Search visual selection "{{{
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
"}}}
