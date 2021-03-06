if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
filetype on
syntax enable

let g:polyglot_disabled = ['markdown', 'vue']

" VIM-PLUG =====================================================================

call plug#begin('~/.vim/plugged')

" Sensible starting point...
Plug 'tpope/vim-sensible'

" Stats and metrics
Plug 'wakatime/vim-wakatime'
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

" syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug '/usr/bin/fzf'

" Colour themes
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'morhetz/gruvbox'

" Better commenting
Plug 'preservim/nerdcommenter'

" status bar and theme
Plug 'vim-airline/vim-airline'

" Follow symlinks
Plug 'moll/vim-bbye'
Plug 'aymericbeaumet/vim-symlink'

" Prettier!!!
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Auto save on every change in normal mode and upon leaving insert mode
Plug '907th/vim-auto-save'

" Close brackets
Plug 'Raimondi/delimitMate'

" See CSS colours
Plug 'ap/vim-css-color'

" Zetty Betty
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

" Type in browser w/ vim
Plug 'subnut/nvim-ghost.nvim', {'do': ':call nvim_ghost#installer#install()'}

" emmet
Plug 'mattn/emmet-vim'

" git
Plug 'tpope/vim-fugitive'

" ============= THE WRITING ROOM ===============================================


" Make vim nice for writing
Plug 'reedes/vim-pencil', {'for' : ['markdown', 'rmarkdown', 'text', 'rmd']}

" Make vim's spellcheck, thesaurus and dictionary betterer
Plug 'reedes/vim-lexical', {'for' : ['markdown', 'rmarkdown', 'text', 'rmd']}

" (Kirby-like) Goyo~!
Plug 'junegunn/goyo.vim', {'for' : ['markdown', 'rmarkdown', 'text', 'rmd']}

" And something to help me focus in the all-too-way-too-very-big terminal
Plug 'junegunn/limelight.vim', {'for' : ['markdown', 'rmarkdown', 'text', 'rmd']}

" CANT EDIT WHAT YOU CANT SEE AM I RIGHT BOYS
Plug 'swordguin/vim-veil'

" ============================================================ END UNDĀIN MĖIYRR

" TODO: conceal keywords and add in math symbols

call plug#end()

" ================================================================= END VIM-PLUG

" KAYAK ZONE ===================================================================
" ========== INDIVIDUAL SETTINGS ===============================================

" folding
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1

set t_ut=

" don't randomly jump to the start of the line (?!)
set nostartofline

" configure colour scheme
set background=dark

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme spaceduck
let g:airline_theme = 'spaceduck'

" Force JSON to hide quotes
let g:vim_json_syntax_conceal = 1

" Show ruler at 80 columns
set colorcolumn=80

" Show line numbers
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

" Silence, autosave
let g:auto_save_silent = 1

" Configure the Mėiyrr
augroup the_meiyrr
  autocmd!
  autocmd FileType markdown,rmarkdown,rmd,text set spell
augroup END

" Rebuild spellfile on command only
nnoremap <leader>S :mkspell! ~/en.utf-8.add<CR>

" turn on that sweet line bg
set cursorline
set cursorcolumn

" Toggle Goyo with ctrl+G (remember, Goyo's only loaded in the Mėiyrr)
nnoremap <C-g> :Goyo<CR>

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

" tab completion for coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" ctrl + / clears the last search
noremap <silent> <c-_> :let @/ = ""<CR>

" Set up my existing Zetty Betty (Zettlekasten 😂)
let g:vimwiki_list = [{'path': '~/MEGAsync/Projects/flintt/TheWritingRoom',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'index': 'Scratchpad'
      \ },
      \ {'path': "~/MEGAsync/zet/",
      \ 'syntax':'markdown',
      \ 'ext':'.md',
      \ 'index': '_inbox'}]

" not every .md is for vimwiki
let g:vimwiki_global_ext = 0

" Search in the Zettlekastens
let g:nv_search_paths = ['~/MEGAsync/Projects/flintt/TheWritingRoom', '~/MEGAsync/zet']

" New Zettles are filenamed like 202011141509 (extension defined in
" g:vimwiki_list above)
let g:zettel_format = "%Y%m%d%H%M %title"

" use [[ ]] style links for Zettlekasten
let g:zettel_link_format="[[%link]]"

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

" FIXING TYPESCRIPT ============================================================

" *.tsx files are React w/ TypeScript
augroup tsx
  au!
  " be able to open *.tsx files
  au BufRead,BufNewFile *.tsx set suffixesadd+=.tsx
  au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
augroup END

" insta linting
set updatetime=300

" .mdx files are Markdown JSX
autocmd BufNewFile,BufRead *.mdx set filetype=markdown.mdx

" Vim veil
nmap <F12> <Plug>Veil

" vimwiki no longer interferes with coc completion
au filetype vimwiki silent! iunmap <buffer> <Tab>

" fix vue slowness
" let g:vue_disable_pre_processors=1
"
let g:airline#extensions#wordcount#filetypes =
    \ ['asciidoc', 'help', 'mail', 'markdown', 'nroff', 'org', 'plaintex', 'rst', 'tex', 'text', 'vimwiki']


" END KAYAK ZONE ===============================================================
