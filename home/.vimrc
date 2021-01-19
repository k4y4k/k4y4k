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
Plug 'junegunn/fzf.vim'
Plug '/usr/bin/fzf'

" Colour themes
Plug 'reedes/vim-colors-pencil'
Plug 'ayu-theme/ayu-vim'

" Better commenting
Plug 'preservim/nerdcommenter'

" highlight trailing spaces
Plug 'bronson/vim-trailing-whitespace'

" status bar and theme
Plug 'vim-airline/vim-airline'

" Follow symlinks
Plug 'moll/vim-bbye'
Plug 'aymericbeaumet/vim-symlink'

" easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

" Prettier!!!
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Auto save on every change in normal mode and upon leaving insert mode
Plug '907th/vim-auto-save'

" Commenting superpowers
Plug 'preservim/nerdcommenter'

" Close brackets
Plug 'Raimondi/delimitMate'

" styled-components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Godot 🕺
Plug 'habamax/vim-godot'

" See CSS colours
Plug 'ap/vim-css-color'

" Zetty Betty
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

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

call plug#end()

" ================================================================= END VIM-PLUG

" KAYAK ZONE ===================================================================
" ========== INDIVIDUAL SETTINGS ===============================================

" configure colour scheme
set termguicolors
set background=dark
let ayucolor='dark'

let g:airline_theme = 'pencil'
colorscheme ayu

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
set scrolloff=999

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

" ctrl + / clears the last search
noremap <silent> <c-_> :let @/ = ""<CR>

" Set up my existing Zetty Betty (Zettlekasten 😂)
let g:vimwiki_list = [{'path': '~/MEGA/Projects/flintt/TheWritingRoom/',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'index': 'Scratchpad'
      \ },
      \ {'path': "~/MEGA/zet/",
      \ 'syntax':'markdown',
      \ 'ext':'.md',
      \ 'index': '_inbox'}]

" not every .md is for vimwiki
let g:vimwiki_global_ext = 0

" Search in the Zettlekasten
let g:nv_search_paths = ['~/MEGA/Projects/flintt/TheWritingRoom']

" New Zettles are filenamed like 202011141509 (extension defined in
" g:vimwiki_list above)
let g:zettel_format = "%Y%m%d%H%M %title"

" use [[ ]] style links for Zettlekasten
let g:zettel_link_format="[[%link]]"

let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "

" It allows to move the cursor past the last character. If you insert a new
" character there, it is automatically padded with spaces.
set virtualedit=all

" Add spellfile to dictionary source for coc-word
set dictionary+=~/en.utf-8.add

function! ZoteroCite()
  " pick a format based on the filetype (customize at will)
  let format = &filetype =~ '.*tex' ? 'citep' : 'mmd'
  let api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format='.format.'&brackets=1'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction

noremap <leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>

function! ZoteroBib()
  " pick a format based on the filetype (customize at will)
  let api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format=formatted-bibliography'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction

noremap <leader>Z "=ZoteroBib()<CR>p
inoremap <C-z> <C-r>=ZoteroBib()<CR>

" custom Goyo entry and leave
 function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  PencilSoft
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=999
  Limelight!
  PencilOff
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" *.tsx files are React w/ TypeScript
augroup tsx
  au!
  au BufRead,BufNewFile *.tsx set filetype=typescript.react
augroup END

" END KAYAK ZONE ===============================================================
