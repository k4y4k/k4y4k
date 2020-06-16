if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype on
syntax enable

call plug#begin('~/.vim/plugged')

" Sensible starting point...
Plug 'tpope/vim-sensible'

" Syntax things
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" TODO: Emmet
Plug 'mattn/emmet-vim'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Colour theme
Plug 'reedes/vim-colors-pencil'

" File tree
Plug 'preservim/nerdtree'

" Better commenting
Plug 'preservim/nerdcommenter'

" highlight trailing spaces
Plug 'bronson/vim-trailing-whitespace'

" status bar and theme
Plug 'vim-airline/vim-airline'

" Follow symlinks
Plug 'moll/vim-bbye' " optional dependency
Plug 'aymericbeaumet/vim-symlink'

" smooth scrolling
Plug 'yuttie/comfortable-motion.vim'

" easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

" Prettier!!!
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" TODO: set up a Writing Room mode for when I need to smash out a chapter of my
" Mike Wazowski × The Onceler fanfic
" (for [R]md files, don't bother w/ others)

" TODO: conceal keywords and add in math symbols

" TODO: YCM installed with Pacman

" TODO: make kayak better at vim section =======================================

if has('python3') && has('timers')
  Plug 'AlphaMycelium/pathfinder.vim'
else
  echoerr 'pathfinder.vim is not supported on this Vim installation'
endif

" ==============================================================================

call plug#end()

colorscheme pencil
let g:airline_theme = 'pencil'
set background=dark

" Force JSON to hide quotes
let g:vim_json_syntax_conceal = 1

set colorcolumn=80
set number
