if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
" TODO: json quote hiding not working properly
Plug 'reedes/vim-colors-pencil'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

syntax on
" TODO: failing neovim health checks about tmux and colours and stuff?

" TODO: set up an environment for [R]md files, don't bother w/ others

colorscheme pencil
set background=dark
