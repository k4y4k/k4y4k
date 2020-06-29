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

" Stats and metrics
Plug 'wakatime/vim-wakatime'
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

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
Plug 'moll/vim-bbye'
Plug 'aymericbeaumet/vim-symlink'

" smooth scrolling
Plug 'yuttie/comfortable-motion.vim'

" easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

" Prettier!!!
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Auto save on every change in normal mode and upon leaving insert mode
Plug '907th/vim-auto-save'

" UNDĀIN MĖIYRR ================================================================
" ============= THE WRITING ROOM ===============================================

" TODO: perhaps even LaTeX

" Make vim nice for writing
Plug 'reedes/vim-pencil', {'for' : ['markdown', 'rmarkdown', 'text', 'rmd']}

" Make vim's spellcheck, thesaurus and dictionary betterer
Plug 'reedes/vim-lexical', {'for' : ['markdown', 'rmarkdown', 'text', 'rmd']}

" (Kirby-like) Goyo~!
Plug 'junegunn/goyo.vim', {'for' : ['markdown', 'rmarkdown', 'text', 'rmd']}

" And something to help me focus in the all-too-way-too-very-big terminal
Plug 'junegunn/limelight.vim', {'for' : ['markdown', 'rmarkdown', 'text', 'rmd']}


" ==============================================================================

" TODO: conceal keywords and add in math symbols

" NOTE: YCM installed with Pacman

" make kayak better at vim section =============================================

if has('python3') && has('timers')
  Plug 'AlphaMycelium/pathfinder.vim'
else
  echoerr 'pathfinder.vim is not supported on this Vim installation'
endif

" Nort h, j, k, l, UP, DOWN, LEFT, RIGHT to make me learn motion movements
Plug 'takac/vim-hardtime'

" ==============================================================================

call plug#end()

colorscheme pencil
let g:airline_theme = 'pencil'
set background=dark

" Force JSON to hide quotes
let g:vim_json_syntax_conceal = 1

set colorcolumn=80
set number

" configure spellchecking
set spelllang=en_au
set spellfile=$HOME/en.utf-8.add

" when we load lexical, enable spellcheck by default
let g:lexical#spell = 1

" use only en_au
let g:lexical#spelllang = 'en_au'

" Code::Stats in the status bar
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])

" Prettier default config
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#print_width = 80

" Turn auto-save on by default
let g:auto_save = 1

" Configure spellchecking for the Mėiyrr
augroup the_meiyrr
	autocmd!
	autocmd FileType markdown,rmarkdown,rmd,text set spell
	mkspell! ~/en.utf-8.add
augroup END
