"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't flick cursor.
set guicursor&
set guicursor+=a:blinkon0

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

" Display candidate supplement.
set nowildmenu
set wildmode=list:longest,full
" Display all the information of the tag by the supplement of the Insert mode.
set showfulltag
" Can supplement a tag in a command-line.
set wildoptions=tagfile

" Enable spell check.
set spelllang=en_us

" Completion setting.
set completeopt=menuone,preview
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
" Set maximam maximam command line window.
set cmdwinheight=5
" No equal window size.
set noequalalways

" Adjust window size of preview and help.
set previewheight=12
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
        \|      silent call MyDeleteView()
        \|      mkview
        \|  endif
augroup END
