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
" Move through breaked lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" Change current directory.
nnoremap <silent> <leader>cd :<C-u>call ChangeBufferDir()<CR>

" Toggle relativenumber.
nnoremap <silent> <leader>nu :<C-u>call ToggleOption('relativenumber')<CR>
nnoremap <silent> <leader>sc :<C-u>call ToggleOption('spell')<CR>

" s: Windows and buffers(High priority)
" The prefix key.
nnoremap    [Window]   <Nop>
nmap    s [Window]

" Windows
nnoremap <silent> [Window]p  <C-w>s
nnoremap <silent> [Window]v  <C-w>v
nnoremap <silent> [Window]c  :<C-u>call pSmartClose()<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
" Move around windows beyond tabs
nnoremap <silent> <Tab> <C-w>w
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" remap Ex-mode.
nnoremap Q  :normal @q<cr>

" Disable ZZ.
nnoremap ZZ  <Nop>

" If press h on head, fold close.
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" If press l on fold, fold open.
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'

"Fast remove highlight search
nnoremap <silent> <leader><cr> :noh<cr>:match<CR>

" Remove trailing white spaces
nnoremap <silent> <leader>ws :call DeleteTrailingWS()<ESC><ESC><cr>:w<cr>
"Remove the Windows ^M
nnoremap <silent> <Leader>dm mzHmx:%s/<C-V><cr>//ge<cr>'xzt'z:delm x z<cr>

"Open a dummy buffer for paste
nnoremap <leader>es :enew<cr>:setl buftype=nofile<cr>
nnoremap <leader>ec :enew ~/tmp/scratch.txt<cr>

" Fast grep
nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr><leader>ll
vmap <silent> <leader>lv :lv /<c-r>=GetVisualSelection()<cr>/ %<cr><leader>ll

" force save to read only file/privileged file
cmap :w!! w !sudo tee % > /dev/null

" Switch between Hex and normal mode
noremap <F8> :call HexMe()<CR>

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
nnoremap [Alt]<S-Tab> :call Stab()<CR>

" Bubble single lines
nmap <Up> [e
nmap <Down> ]e
" Bubble multiple lines
vmap <Up> [egv
vmap <Down> ]egv

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]


" Tabularize is a plugin for alignment
autocmd VimEnter *
\ if exists(":Tabularize")
\|   nmap <Leader>a= :Tabularize /=<CR>
\|   vmap <Leader>a= :Tabularize /=<CR>
\|   nmap <Leader>a: :Tabularize /:\zs<CR>
\|   vmap <Leader>a: :Tabularize /:\zs<CR>
\| endif

inoremap <silent> <Bar>   <Bar><Esc>:call AutoAlignBar()<CR>a

" Visual undo history & undo branch
nnoremap <Leader>un :GundoToggle<CR>

" mappings for folding
nnoremap <Space> za
vnoremap <Space> za

