"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""
" Insert Mode
"""""""""""""""""
" <C-t>: insert tab.
inoremap <C-t>  <C-v><TAB>
" <C-d>: delete char.
inoremap <C-d>  <Del>
" <C-a>: move to head.
inoremap <silent><C-a>  <C-o>^
" Enable undo <C-w> and <C-u>.
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-u>  <C-g>u<C-u>


"""""""""""""""""
" Commandline Mode
"""""""""""""""""
" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
" <C-b>: previous char.
cnoremap <C-b>          <Left>
" <C-d>: delete char.
cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
" <C-f>: next char.
cnoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>
" <C-k>, K: delete to end.
cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
      \ '' : getcmdline()[:getcmdpos()-2]<CR>
" <C-y>: paste.
cnoremap <C-y>          <C-r>*


"""""""""""""""""
" Visual Mode
"""""""""""""""""
" Toggle relativenumber.
nnoremap <silent> <leader>cd :<C-u>call g:cd_buffer_dir()<CR>

" Change current directory.
nnoremap <silent> <leader>nu :<C-u>call ToggleOption('relativenumber')<CR>
nnoremap <silent> <leader>sc :<C-u>call ToggleOption('spell')<CR>

" Easily syntax change.
nnoremap <silent> <leader>ft
      \ :<C-u>Unite -start-insert filetype filetype/new<CR>


" s: Windows and buffers(High priority)
" The prefix key.
nnoremap    [Window]   <Nop>
nmap    s [Window]

" Windows
nnoremap <silent> [Window]p  :<C-u>call g:split_nicely()<CR>
nnoremap <silent> [Window]c  :<C-u>call g:smart_close()<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> [Window]d  :<C-u>bp <BAR> bd #<CR>
:autocmd BufDelete * if len(filter(range(1, bufnr('$')),
                        \'! empty(bufname(v:val)) && buflisted(v:val)')) == 1 |
                     \ quit |
                   \ endif
" Move around windows beyond tabs
nnoremap <silent> <Tab> :call NextWindow()<CR>
nnoremap <silent> <S-Tab> :call PreviousWindowOrTab()<CR>

" The prefix key.
nnoremap [Alt]   <Nop>
xnoremap [Alt]   <Nop>
onoremap [Alt]   <Nop>
nmap    e  [Alt]
xmap    e  [Alt]
omap    e  [Alt]

nnoremap    [Alt]e   e
xnoremap    [Alt]e   e

" Insert blank line.
nnoremap <silent> [Alt]o o<Space><BS><ESC>
nnoremap <silent> [Alt]O O<Space><BS><ESC>

" Yank to end of the line.
nnoremap [Alt]y y$
nnoremap Y y$

" remap Ex-mode.
nnoremap Q  q

" Smart <C-f>, <C-b>.
"noremap <expr> <C-f> max([winheight(0) - 2, 1])
"      \ . "\<C-d>" . (line('w$') >= line('$') ? "L" : "H")
"noremap <expr> <C-b> max([winheight(0) - 2, 1])
"      \ . "\<C-u>" . (line('w0') <= 1 ? "H" : "L")

" Disable ZZ.
nnoremap ZZ  <Nop>

" Paste next line.
nnoremap <silent> gp o<ESC>p^
nnoremap <silent> gP O<ESC>P^
xnoremap <silent> gp o<ESC>p^
xnoremap <silent> gP O<ESC>P^

" If press h on head, fold close.
"nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" If press l on fold, fold open.
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'

"Fast remove highlight search
nnoremap <silent> <leader><cr> :noh<cr>:match<CR>

" Remove trailing white spaces
nnoremap <silent> <leader>ws :call DeleteTrailingWS()<ESC><ESC><cr>:w<cr>
"Remove the Windows ^M
nnoremap <silent> <Leader>dm mzHmx:%s/<C-V><cr>//ge<cr>'xzt'z:delm x z<cr>

" Quickfix
" The prefix key.
nnoremap [Quickfix]   <Nop>

" Toggle quickfix window.
nnoremap <silent> [Quickfix]<Space>
      \ :<C-u>call toggle_quickfix_window()<CR>

nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>
nnoremap <leader>cw :cw 10<cr>

"Open a dummy buffer for paste
nnoremap <leader>es :tabnew<cr>:setl buftype=nofile<cr>
nnoremap <leader>ec :tabnew ~/tmp/scratch.txt<cr>
