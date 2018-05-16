vimrc
=====

my .vimrc and .vim directory

usage
-----

Execute command:  
     `cd ~ && git clone https://github.com/gdzhu/.vim && ln -s .vim/.vimrc .vimrc && cd -`  
enjoy Viming!  

Vim will try to fetch required plugins from github the first time you run it  

**always remember to backup your own stuff.

plugin list
-----------


   -------------------------------------------------------------
         altercation/vim-colors-solarized " Solarized color scheme
         vim-airline/vim-airline-themes   " airline themes
         bling/vim-airline                " Powerline status line plugin
         vim-scripts/ShowMarks7           " add visual effects to marks
         airblade/vim-gitgutter           " list git changes in file

         """ edit
         junegunn/vim-peekaboo            " show the contents of the registers on the sidebar
         junegunn/fzf                     " fzf command-line fuzzy finder
         junegunn/fzf.vim                 " fzf for vim
         tpope/vim-unimpaired             " Numerous bracket mappings
         tpope/vim-commentary             " Comment stuff out
         tpope/vim-endwise                " helps to end certain structures automatically
         tpope/vim-fugitive               " git aliases
         tpope/vim-surround               " modify surroundings of text
         tpope/vim-repeat                 " repeat last mapped command with dot
         sjl/gundo.vim                    " visual undo tree
         vim-scripts/loremipsum           " generate lorem Ipsum
         vim-scripts/matchit.zip          " enhance % match
         godlygeek/tabular                " line up text according to pattern
         tommcdo/vim-exchange             " exchange text
         ap/vim-css-color                 " Highlight Hex color pallets

         """ Auto complete
         Valloric/YouCompleteMe           " auto complete
         rdnetto/YCM-Generator            " auto complete
         SirVer/ultisnips                 " the ultimate solution for snippets in Vim
         honza/vim-snippets               " vim-snipmate & ultisnips default snippets
         w0rp/ale                         " Asynchronous Lint Engine
         sheerun/vim-polyglot             " Syntax
         mileszs/ack.vim                  " Search with ag
         tpope/vim-sleuth                 " Auto detect tabstop
         wellle/targets.vim               " expand the default 'inside/arround object' operation
         haya14busa/incsearch.vim         " increamental search
         'phamer/AnsiEsc'                   " color escape

         vim-latex/vim-latex              " Work with latex
         " terryma/vim-expand-region      " visually select increasingly larger regions of text
         " scrooloose/syntastic           " syntax
         " mattn/emmet-vim                " html & CSS
         " vim-scripts/Tagbar             " Tag list
         " Konfekt/FastFold               " Speed up Vim by updateing folds only when called-for
         " ctrlpvim/ctrlp.vim             " search through files/buffers/MRU
   -------------------------------------------------------------
