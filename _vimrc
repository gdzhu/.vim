"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 set nocompatible               " Be iMproved

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 "
 " Note: You don't set neobundle setting in .gvimrc!
 " Original repos on github
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'tpope/vim-pathogen'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'jistr/vim-nerdtree-tabs'          " add some featues to NERDTree
 NeoBundle 'scrooloose/syntastic'
 " vim-scripts repos
 NeoBundle 'bling/vim-airline'                " status line plugin
 NeoBundle 'jmcantrell/vim-virtualenv'        " work with python venv
 NeoBundle 'FSwitch'                          " switch between associated files, eg, .h and .cpp
 NeoBundle 'genutils'                         " general utilities for vim
 NeoBundle 'lookupfile'                       " lookup files inside vim
 NeoBundle 'Marks-Browser'
 NeoBundle 'matchit.zip'                      " more powerful match with %
 NeoBundle 'multvals.vim'                     " Array library that uses patterns as separators
 NeoBundle 'ShowMarks'
 NeoBundle 'snipMate'                         " snippet plugin
 NeoBundle 'surround.vim'                     " change surroundings quickly
 NeoBundle 'Tagbar'
 NeoBundle 'The-NERD-Commenter'
 NeoBundle 'Vimball'

 filetype plugin indent on     " Required!
 "
 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
 NeoBundleCheck

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"activate pathogen
call pathogen#infect()

"Sets how many lines of history VIM har to remember
set history=4000

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vim/undo

"Set encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>wf :w!<cr>

"Fast quiting
nmap <silent> <leader>qw :wq<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>qq :q<cr>
nmap <silent> <leader>qa :qa<cr>

"Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set font
if has("gui_gtk2")
  set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 10,
          \DejaVu\ Sans\ Mono\ 10,
          \Courier\ New\ 10,
          \Courier\ 10,
          \Luxi\ Mono\ 10,
          \SimSun\ 10,
          \WenQuanYi\ Micro\ Hei\ Mono\ 10
elseif has("x11")
  set gfn=*-*-medium-r-normal--10-*-*-*-*-m-*-*
endif

" Avoid clearing hilight definition in plugins
if !exists("g:vimrc_loaded")
    "Enable syntax hl
    syntax enable

    " color scheme
    if has("gui_running")
        set guioptions-=T
        set guioptions-=m
        set guioptions-=L
        set guioptions-=r
        " colorscheme darkblue_my
        colorscheme desert_my
        set cursorline
    else
        colorscheme desert_my
    endif " has
endif " exists(...)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set so=7            "Set 7 lines to the curors - when moving vertical..

set showcmd         "show incomplete cmds down the bottom

set showmode        "show current mode down the bottom

set wildmenu        "Turn on WiLd menu

set ruler           "Always show current position

set cmdheight=2     "The commandbar is 2 high

set nu              "Show line number

set lz              "Do not redraw, when running macros.. lazyredraw

set backspace=eol,start,indent "Set backspace

set list            "display tabs and trailing spaces

set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set whichwrap+=<,>  "Bbackspace and cursor keys wrap to

set incsearch       "Include search

set hlsearch        "Highlight search things

set magic           "Set magic on

set showmatch       "show matching bracets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Actually, the tab does not switch buffers, but my arrows
"Bclose function can be found in "Buffer related" section
map <leader>bd :silent! bp<bar>sp<bar>silent! bn<bar>bd<CR>

"Smart way to move btw. windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

"Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=useopen
  set stal=1
catch
endtry

"Switch to current dir
map <silent> <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTrailingWS()
  exe "normal mz"
  %s/[ \t]\+$//ge
  nohl
  exe "normal `z"
  exe "delmarks z"
  exe "normal m"
endfunc

nmap <silent> <leader>ws :call DeleteTrailingWS()<ESC><ESC><cr>:w<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Open a dummy buffer for paste
map <leader>es :tabnew<cr>:setl buftype=nofile<cr>
map <leader>ec :tabnew ~/tmp/scratch.txt<cr>

"Restore cursor to file position in previous editing session
" au BufWinLeave * mkview                    "eating up space
" au BufWinEnter * silent loadview
set viminfo='50,\"100,:20,n~/.viminfo
au BufReadPost * call LocatePos()
function! LocatePos()
  if line("'\"") > 0 && line("'\"") <= line("$")
    normal! g`"
  endif
endfunction
au BufEnter * exe "norm zz"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sessionoptions-=curdir
set sessionoptions+=sesdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
syntax on

au FileType html,python,vim,javascript,xml setl shiftwidth=2
au FileType html,python,vim,javascript,xml setl tabstop=2
au FileType txt setl lbr
au FileType txt setl tw=78

"Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sc : setl spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" options
set completeopt=menu
set complete-=u
set complete-=i

" mapping
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"
inoremap <C-]>             <C-X><C-]>
inoremap <C-F>             <C-X><C-F>
inoremap <C-D>             <C-X><C-D>
inoremap <C-L>             <C-X><C-L>

" Enable syntax
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \  setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
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

"Basically you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """"""""""""""""""""""""""""""
   " airline
   """"""""""""""""""""""""""""""
   set t_Co=256
   if !exists('g:airline_symbols')
       let g:airline_symbols = {}
   endif
   let g:airline_symbols.space = "\ua0"
   let g:airline_powerline_fonts = 1
   let g:airline_theme='murmur'

   " tabline enabled
   let g:airline#extensions#tabline#enabled = 1
   " not show buffers
   let g:airline#extensions#tabline#show_buffers = 0
   " display only tab number
   let g:airline#extensions#tabline#tab_nr_type = 1
   " not show tab type on the right of the screen
   let g:airline#extensions#tabline#show_tab_type = 0
   " not show close button on the right of the screen
   let g:airline#extensions#tabline#show_close_button = 0

   " enable whitespace
   let g:airline#extension#whitespace#enabled = 1

   " """"""""""""""""""""""""""""""
   " " NERDTree setting
   " """"""""""""""""""""""""""""""
   " "nerdtree settings
   let g:NERDTreeMouseMode = 2
   let g:NERDTreeWinSize = 25
   let g:NERDTreeShowHidden = 1
   let g:NERDTreeMinimalUI = 1
   let g:nerdtree_tabs_open_on_console_startup = 1
   " let g:nerdtree_tabs_autofind = 1
   let g:nerdtree_tabs_focus_on_files = 1

   """"""""""""""""""""""""""""""
   " Tagbar setting
   """"""""""""""""""""""""""""""
   nmap <F12> <Esc>:!ctags -R *<CR>
   let g:tagbar_ctags_bin = '/usr/bin/ctags'
   let g:tagbar_autoshowtag = 1
   let g:tagbar_width = 30
   let g:tagbar_compact = 1
   let g:tagbar_show_visibility = 1
   let g:tagbar_expand = 1

   au BufEnter * nested :call tagbar#autoopen(0)

   " switch to main edit buffer
   autocmd VimEnter * nested sb "@%"

   """"""""""""""""""""""""""""""
   " lookupfile setting
   """"""""""""""""""""""""""""""
   let g:LookupFile_MinPatLength = 2
   let g:LookupFile_PreserveLastPattern = 0
   let g:LookupFile_PreservePatternHistory = 0
   let g:LookupFile_AlwaysAcceptFirst = 1
   let g:LookupFile_AllowNewFiles = 0
   let g:LookupFile_UsingSpecializedTags = 1
   let g:LookupFile_Bufs_LikeBufCmd = 0
   let g:LookupFile_ignorecase = 1
   let g:LookupFile_smartcase = 1
   if filereadable("./filenametags")
       let g:LookupFile_TagExpr = '"./filenametags"'
   endif
   nmap <silent> <leader>lk :LUTags<cr>
   nmap <silent> <leader>ll :LUBufs<cr>
   nmap <silent> <leader>lw :LUWalk<cr>

   " lookup file with ignore case
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
   let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

   """"""""""""""""""""""""""""""
   " markbrowser setting
   """"""""""""""""""""""""""""""
   nmap <silent> <leader>mk :MarksBrowser<cr>

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
   " FeralToggleCommentify setting
   """"""""""""""""""""""""""""""
   let loaded_feraltogglecommentify = 1
   "map <silent> <leader>tc :call ToggleCommentify()<CR>j
   "imap <M-c> <ESC>:call ToggleCommentify()<CR>j

   """"""""""""""""""""""""""""""
   " vimgdb setting
   """"""""""""""""""""""""""""""
   let g:vimgdb_debug_file = ""
   run macros/gdb_mappings.vim

   """"""""""""""""""""""""""""""
   let g:EclimTaglistEnabled=0

   """"""""""""""""""""""""""""""
   " FSwitch setting
   """"""""""""""""""""""""""""""
   au! BufEnter *.cc,*.cpp let b:fswitchdst = 'h' | let b:fswitchlocs = '.'
   au! BufEnter *.h let b:fswitchdst = 'cc,cpp' | let b:fswitchlocs = '.'
   let g:fsnonewfiles = "on"
   nmap <silent> <Leader>of :FSHere<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Todo
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   "au BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim

   """"""""""""""""""""""""""""""
   " HTML related
   """"""""""""""""""""""""""""""
   " HTML entities - used by xml edit plugin
   let xml_use_xhtml = 1
   "let xml_no_auto_nesting = 1

   "To HTML
   let html_use_css = 1
   let html_number_lines = 0
   let use_xhtml = 1

   """""""""""""""""""""""""""""""
   " Vim section
   """""""""""""""""""""""""""""""
   autocmd FileType vim set nofen
   autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

   """"""""""""""""""""""""""""""
   " HTML
   """""""""""""""""""""""""""""""
   au FileType html set ft=xml
   au FileType html set syntax=html


   """"""""""""""""""""""""""""""
   " C/C++
   """""""""""""""""""""""""""""""
   autocmd FileType c,cpp,xml  map <buffer> <leader><space> :make<cr>
   "autocmd FileType c,cpp  setl foldmethod=syntax | setl fen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   "Quickfix
   nmap <leader>cn :cn<cr>
   nmap <leader>cp :cp<cr>
   nmap <leader>cw :cw 10<cr>
   "nmap <leader>cc :botright lw 10<cr>
   "map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>

   function! s:GetVisualSelection()
       let save_a = @a
       silent normal! gv"ay
       let v = @a
       let @a = save_a
       let var = escape(v, '\\/.$*')
       return var
   endfunction

   " Fast grep
   nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
   vmap <silent> <leader>lv :lv /<c-r>=<sid>GetVisualSelection()<cr>/ %<cr>:lw<cr>

   " Fast diff
   "cmap @vd vertical diffsplit
   set diffopt+=vertical

   "Remove the Windows ^M
   noremap <Leader>dm mzHmx:%s/<C-V><cr>//ge<cr>'xzt'z:delm x z<cr>

   "Paste toggle - when pasting something in, don't indent.
   set pastetoggle=<F3>

   "Remove indenting on empty lines
   "map <F2> :%s/\s*$//g<cr>:noh<cr>''

   "Super paste
   "inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

   "Fast Ex command
   "nnoremap ; :

   "For mark move
   "nnoremap <leader>' '

   "Fast copy
   "nnoremap ' "

   "A function that inserts links & anchors on a TOhtml export.
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark as loaded
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_loaded = 1
