" Edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread

" Smart insert tab setting.
set smarttab
" Exchange tab to spaces.
set expandtab

" Round indent by shiftwidth.
set shiftround

" Enable modeline.
set modeline

" Enable backspace delete indent and newline.
set backspace=indent,eol,start

" Highlight parenthesis.
set showmatch
" Highlight when CursorMoved.
set cpoptions-=m
set matchtime=1
" Highlight <>.
set matchpairs+=<:>

" Display another buffer when current buffer isn't saved.
set hidden

" Ignore case on insert completion.
set infercase

" set foldmethod=expr
set foldmethod=syntax
set foldmethod=manual
" Show folding level.
set foldcolumn=3
set fillchars=vert:\|
" set commentstring=%s
" Enable folding.
set foldenable

" Use grep.
set grepprg=grep\ -inH

" Exclude = from isfilename.
set isfname-==

" Keymapping timeout.
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time.
set updatetime=1000

" Set swap directory.
set directory-=.

" tell VIM to use an undo file
set undofile
set undodir=$UNDO

" Enable virtualedit in visual block mode.
set virtualedit=block

" Set keyword help.
set keywordprg=:help

" Use par as external formatter if possible
if executable("par")
    set formatprg=par\ -w78
endif

" Sets how many lines of history VIM have to remember
set history=4000

" Set encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" Don't create backup.
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.

