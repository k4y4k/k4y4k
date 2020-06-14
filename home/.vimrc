if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

call plug#begin('~/.vim/plugged')

" Sensible starting point...
Plug 'tpope/vim-sensible'

" Syntax things
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" TODO: json quote hiding not working properly
Plug 'reedes/vim-colors-pencil'

" TODO: highlight trailing spaces

" TODO: airline

" Follow symlinks
Plug 'moll/vim-bbye' " optional dependency
Plug 'aymericbeaumet/vim-symlink'

" TODO: "intellisense" / completions

" TODO: set up a Writing Room mode for when I need to smash out a chapter of my
" Mike Wazowski × The Onceler fanfic

" TODO: ruler at 80 / 120 characters

" TODO: conceal keywords and add in math symbols

call plug#end()

syntax on
" TODO: failing neovim health checks about tmux and colours and stuff?

" TODO: set up an environment for [R]md files, don't bother w/ others

colorscheme pencil
set background=dark
