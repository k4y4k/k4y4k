if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
filetype on
syntax enable

" VIM-PLUG =====================================================================

call plug#begin('~/.vim/plugged')

" Sensible starting point...
Plug 'tpope/vim-sensible'

" Stats and metrics
Plug 'wakatime/vim-wakatime'
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

" Syntax things
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Emmet
Plug 'mattn/emmet-vim'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug '/usr/bin/fzf'

" Colour theme
Plug 'reedes/vim-colors-pencil'

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

" A wiki
Plug 'vimwiki/vimwiki'

" organisation uwu
Plug 'blindFS/vim-taskwarrior'

" Commenting superpowers
Plug 'preservim/nerdcommenter'

" Close brackets
Plug 'Raimondi/delimitMate'

" styled-components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Godot 🕺
Plug 'habamax/vim-godot'

" Discord Rich Presence (this one goes out to you, Ere)
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

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

" ============================================================ END UNDĀIN MĖIYRR

" TODO: conceal keywords and add in math symbols

" Pathfinder (alternatively: want loop errors every 20 seconds?)
if has('python3') && has('timers') && !has("nvim")
  Plug 'AlphaMycelium/pathfinder.vim'
endif

call plug#end()

" ================================================================= END VIM-PLUG

" KAYAK ZONE ===================================================================
" ========== INDIVIDUAL SETTINGS ===============================================

" configure colour scheme
colorscheme pencil
let g:airline_theme = 'pencil'
set background=dark

" Force JSON to hide quotes
let g:vim_json_syntax_conceal = 1

" Show ruler at 80 columns
set colorcolumn=80

" Show line numbers
set number

" configure spellchecking
set spelllang=en_au
set spellfile=$HOME/en.utf-8.add

" TODO: thesaurus?

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

" Silence, autosave
let g:auto_save_silent = 1

" Configure the Mėiyrr
augroup the_meiyrr
  autocmd!
  autocmd FileType markdown,rmarkdown,rmd,text set spell
augroup END

" Rebuild spellfile on command only
nnoremap <leader>Z :mkspell! ~/en.utf-8.add<CR>

" turn on that sweet line bg
set cursorline
set cursorcolumn

" Toggle Goyo with ctrl+G (remember, Goyo's only loaded in the Mėiyrr)
nnoremap <C-g> :Goyo<CR>

" Similarly, toggle Limelight with <leader>+l / <leader>+L
nnoremap <leader>l :Limelight<CR>
nnoremap <leader>L :Limelight!<CR>

" Configuration for vim-markdown
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1

" Have lines wrap instead of continue off-screen
set linebreak

" Converts tabs to spaces
set expandtab

" Use two spaces instead of tabs
set tabstop=2

" The same but for indents
set shiftwidth=2

" Keep cursor in approximately the middle of the screen (I usually use a
" horizontal display)
set scrolloff=50

" Wrap searches around the end of the file
set wrapscan

" comment like // ... rather than //...
let NERDSpaceDelims=1

" enable hybrid line numbers in normal mode because I can't count, but keep
" the absolute one in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" setup and keyboard shortcuts for Godot
func! GodotSettings() abort
  setlocal foldmethod=expr
  setlocal tabstop=4
  nnoremap <buffer> <F4> :GodotRunLast<CR>
  nnoremap <buffer> <F5> :GodotRun<CR>
  nnoremap <buffer> <F6> :GodotRunCurrent<CR>
  nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
  au FileType gdscript call GodotSettings()
augroup end

" use folding
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1

" tab completion for coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" END KAYAK ZONE ===============================================================
