"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM have to remember
set history=4000

" Set encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" Show <TAB> and <CR>
set list
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%

" Always display statusline.
set laststatus=2

" Height of command line.
set cmdheight=2

" Not show command on statusline.
set noshowcmd

" Turn down a long line appointed in 'breakat'
set linebreak
set showbreak=\
set breakat=\ \	;:,!?
" Wrap conditions.
set whichwrap+=h,l,<,>,[,],b,s,~
if exists('+breakindent')
  set breakindent
  set wrap
else
  set nowrap
endif

" Don't create backup.
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.

" Display candidate supplement.
set nowildmenu
set wildmode=list:longest,full
" Increase history amount.
set history=2000
" Display all the information of the tag by the supplement of the Insert mode.
set showfulltag
" Can supplement a tag in a command-line.
set wildoptions=tagfile

" Disable menu
let g:did_install_default_menus = 1

" Enable spell check.
set spelllang=en_us

" Completion setting.
set completeopt=menuone
" Don't complete from other buffer.
set complete=.
" Set popup menu max height.
set pumheight=20

" Report changes.
set report=0

" Maintain a current line at the time of movement as much as possible.
set nostartofline

" Splitting a window will put the new window below the current one.
set splitbelow
" Splitting a window will put the new window right the current one.
set splitright
" Set minimal width for current window.
set winwidth=30
" Set minimal height for current window.
set winheight=1
" Set maximam maximam command line window.
set cmdwinheight=5
" No equal window size.
set noequalalways

" Adjust window size of preview and help.
set previewheight=8
set helpheight=12

" When a line is long, do not omit it in @.
set display=lastline
" Display an invisible letter with hex format.
set display+=uhex

" View setting.
set viewdir=$VIEW
set viewoptions-=options
set viewoptions+=slash,unix

" session setting.
set sessionoptions-=curdir
set sessionoptions+=sesdir

" Set 7 lines to the curors - when moving vertical..
set so=7
" show current mode down the bottom
set showmode
" Always show current position
set ruler
" Show line number
set nu
" Include search
set incsearch
" Highlight search things
set hlsearch
" Set magic on
set magic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View restore
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo='50,\"100,:20,%,n~/.viminfo

augroup vimrc
  autocmd BufWinLeave,BufHidden *
        \   if expand('%') != '' && &buftype !~ 'nofile'
        \|      mkview
        \|  endif
  autocmd BufWinEnter *
        \   if expand('%') != '' && &buftype !~ 'nofile'
        \|      silent loadview
        \|  endif
augroup END
