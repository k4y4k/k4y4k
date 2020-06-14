if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on
set autoread
set regexpengine=1
set lazyredraw

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'prettier/vim-prettier', {
			\ 'do': 'yarn install'}
Plug '907th/vim-auto-save'
Plug 'bling/vim-bufferline'
" Plug 'micarmst/vim-spellsync'
" TODO: do this manually
Plug 'bronson/vim-trailing-whitespace'
Plug 'dbmrq/vim-ditto'
Plug 'dense-analysis/ale'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'panozzaj/vim-autocorrect'
Plug 'preservim/nerdtree'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'wakatime/vim-wakatime'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Quramy/tsuquyomi'

" Initialize plugin system
call plug#end()

augroup javascript_folding
    au!
    au FileType javascript,json setlocal foldmethod=syntax
augroup END

set t_Co=256
" colorscheme 256_noir
colorscheme pencil

" Change highlighting of cursor line when entering/leaving Insert Mode
set cursorline
" highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
" autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
" autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

set spelllang=en_au

let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])

let g:auto_save = 1

set spellfile=$HOME/MEGAsync/vimdict.utf8.add

map <C-n> :NERDTreeToggle<CR>

let g:pencil_gutter_color = 1

let g:pencil_terminal_italics = 1

let g:airline_theme = 'pencil'

set background=dark

let g:pencil#conceallevel = 3

let g:pencil#concealcursor = 'c'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']

autocmd FileType markdown call AutoCorrect()

autocmd FileType rmarkdown call AutoCorrect()

au FileType markdown,text,tex,rmarkdown DittoOn

nmap <leader>di <Plug>ToggleDitto

nmap =d <Plug>DittoNext

nmap -d <Plug>DittoPrev

nmap +d <Plug>DittoGood

nmap _d <Plug>DittoBad

nmap ]d <Plug>DittoMore

nmap [d <Plug>DittoLess

map ,s <plug>NERDCommenterSexy

let g:user_emmet_install_global = 0

autocmd FileType html,css,js,jsx,ts,typescript,tsx EmmetInstall

let g:tq_openoffice_en_file="~/Downloads/MyThes-1.0/th_en_US_new"

let g:prettier#config#tab_width = '2'

let g:prettier#config#use_tabs = 'false'

if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers['typescript'] = ['.']

let g:airline#extensions#ale#enabled = 1
