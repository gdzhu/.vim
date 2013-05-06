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
" comment NERDTree out because some of the code have been modified
" use the modified version instead.
"NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'scrooloose/syntastic'
 " vim-scripts repos
 NeoBundle 'bufexplorer.zip'
 NeoBundle 'FSwitch'
 NeoBundle 'genutils'
 NeoBundle 'lookupfile'
 NeoBundle 'Marks-Browser'
 NeoBundle 'matchit.zip'
 NeoBundle 'multvals.vim'
 NeoBundle 'ShowMarks'
 NeoBundle 'snipMate'
 NeoBundle 'surround.vim'
 NeoBundle 'Tagbar'
 NeoBundle 'taglist.vim'
 NeoBundle 'The-NERD-Commenter'
 NeoBundle 'Vimball'
 NeoBundle 'winmanager--Fox'
 " Non github repos
    "NeoBundle 'git://git.wincent.com/command-t.git'
 " Non git repos
    "NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

 " ...

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
set history=400

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

" Switch to buffer according to file name
function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction

"Fast edit vimrc
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
"When .vimrc is edited, reload it
"autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set font
if has("gui_gtk2")
  set gfn=Courier\ New\ 10,Courier\ 10,Luxi\ Mono\ 10,
        \DejaVu\ Sans\ Mono\ 10,Bitstream\ Vera\ Sans\ Mono\ 10,
        \SimSun\ 10,WenQuanYi\ Micro\ Hei\ Mono\ 10
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
        colorscheme darkblue_my
        "hi normal guibg=#294d4a
        set cursorline
    else
        colorscheme desert_my
    endif " has
endif " exists(...)

"Highlight current
set cursorline
set cursorcolumn
hi CursorLine guibg=#333333
hi CursorColumn guibg=#333333

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
if v:version >= 703
  set colorcolumn=80  "show column highlight at col 80
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Actually, the tab does not switch buffers, but my arrows
"Bclose function can be found in "Buffer related" section
map <leader>bd :Bclose<cr>

"Smart way to move btw. windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

"Tab configuration
map <leader>tn :tabnew
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=useopen
  set stal=1
catch
endtry

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i

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
set viminfo='10,\"100,:20,n~/.viminfo
au BufReadPost * if line("'\"") > 0 |
                 \ if line("'\"") <= line("$") |
                   \ exe "norm '\"" |
                 \ else |
                   \ exe "norm $" |
                 \ endif |
               \ endif

  " Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete ".l:currentBufNum)
   endif
endfunction

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
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
"statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'),
                      \ 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

"http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"hacks from above (the url, not jesus) to delete fugitive buffers when we
"leave them - otherwise the buffer list gets poluted
"
"add a mapping on .. to view parent tree
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


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
   " super tab
   """"""""""""""""""""""""""""""
   let g:SuperTabPluginLoaded=1 " Avoid load SuperTab Plugin

   """"""""""""""""""""""""""""""
   " bufexplorer setting
   """"""""""""""""""""""""""""""
   let g:bufExplorerDefaultHelp=1       " Do not show default help.
   let g:bufExplorerShowRelativePath=1  " Show relative paths.
   let g:bufExplorerSortBy='mru'        " Sort by most recently used.
   let g:bufExplorerSplitType=''        " Split horizontally
   let g:bufExplorerOpenMode=0          " Open in current window
   let g:bufExplorerSplitBelow=1        " Split below current window
   let g:bufExplorerMaxHeight=25        " Max height

   """"""""""""""""""""""""""""""
   " taglist setting
   """"""""""""""""""""""""""""""
   let Tlist_Ctags_Cmd = '/usr/bin/ctags'
   let Tlist_Show_One_File = 1
   let Tlist_Use_Right_Window = 1
   let Tlist_WinWidth = 40
   nmap <F12> <Esc>:!ctags -R *<CR>

   """"""""""""""""""""""""""""""
   " NERDTree setting
   """"""""""""""""""""""""""""""
   "nerdtree settings
   let g:NERDTreeMouseMode = 2
   "let g:NERDTreeWinSize = 30

   let NERDTree_title = '__NERD_Tree__'
   function! NERDTree_Start()
    exe "NERDTree"
   endfunction

   function! NERDTree_IsValid()
    return 1
   endfunction

   """"""""""""""""""""""""""""""
   " winmanager setting
   """"""""""""""""""""""""""""""
   let g:winManagerWindowLayout = "NERDTree|BufExplorer"
   let g:winManagerWidth = 30
   "let g:winManagerAutoOpen = 1    call manually due to focus issue
   let g:defaultExplorer = 0
   let g:persistentBehaviour = 0

   nmap <C-W><C-F> :FirstExplorerWindow<cr>
   nmap <C-W><C-B> :BottomExplorerWindow<cr>
   nmap <silent> <F8> :WMToggle<cr> :TlistToggle<cr>

   au VimEnter * WMToggle
   au VimEnter * TlistToggle

   function! Close()
     let i = 1
     let flag = 0
     while i <= winnr('$')
       let Name = bufname(winbufnr(i))
       if Name != "__NERD_Tree__" &&
        \ Name != "__Tag_List__" &&
        \ Name != "[Buf List]"
         let flag = 1
       endif
       let i = i + 1
     endwhile
     if flag == 0
       bdelete
       qa
     endif
   endfunction

   autocmd bufenter * call Close()

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
