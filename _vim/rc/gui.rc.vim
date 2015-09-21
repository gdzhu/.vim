"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set t_Co=256

"""""""""""""""""
" ColorScheme
"""""""""""""""""
set background=dark
"set background=light
"let g:solarized_termcolors=256
"let g:solarized_termcolors=16
"let g:solarized_termtrans=1
colorscheme solarized


"""""""""""""""""
" Font
"""""""""""""""""
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

"""""""""""""""""
" Mouse
"""""""""""""""""
set mouse=a
set mousemodel=

" Don't focus the window when the mouse pointer is moved.
set nomousefocus
" Hide mouse pointer on insert mode.
set mousehide

"""""""""""""""""
" Menu
"""""""""""""""""
" Hide toolbar and menus.
set guioptions-=Tt
set guioptions-=m
" Scrollbar is always off.
set guioptions-=rL
" Not guitablabel.
set guioptions-=e

" Confirm without window.
set guioptions+=c

"""""""""""""""""
" View
"""""""""""""""""
" Don't flick cursor.
set guicursor&
set guicursor+=a:blinkon0
