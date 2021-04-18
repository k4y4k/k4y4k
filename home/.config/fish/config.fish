set TERM tmux-256color

set EDITOR nvim

set -Ux ANDROID_HOME /opt/android-sdk
set -Ux ANDROID_NDK_ROOT /opt/android-ndk

set PATH $ANDROID_HOME/tools $PATH
set PATH $ANDROID_HOME/platform-tools $PATH

set PATH /home/kayak/.local/bin $PATH

alias yi="yay -Syu --rebuild --noconfirm --sudoloop visual-studio-code-insiders-bin"
alias work-here="subl . && smerge ."

function zeal-docs-fix
    pushd "$HOME/.local/share/Zeal/Zeal/docsets" >/dev/null || return
    find . -iname 'react-main*.js' -exec rm '{}' \;
    popd >/dev/null || exit
end

thefuck --alias | source

. "$HOME/.homesick/repos/homeshick/homeshick.fish"
source "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"

set PATH /home/kayak/bin $PATH

alias lss="exa -a --grid --long"

homeshick --quiet refresh 2

alias zz="dunstctl close-all"
export QT_QPA_PLATFORMTHEME=qt5ct

# fix ruby
set PATH $PATH (ruby -e 'puts Gem.user_dir')/bin

function np #[n]vim-[p]rettier
  # get full path + filename (passed in as argument)
  set EDITING $argv
  # extract dir from full path
  set EDITINGPATH (dirname $argv)

  # after finishing up in nvim, run prettier on the dir
  nvim -p $argv && prettier --write $EDITINGPATH/*.*
end

# Update nVIM
alias uvim="nvim -c 'PlugClean!|PlugUpdate|PlugInstall|qa'"

# remake Spellfile for n/VIM
alias svim="nvim -c 'mkspell! ~/en.utf-8.add'"

# [p]ush to [a]ll remotes
alias pa='git remote | xargs -L1 git push --all'

# what now?
alias what-now="task what"
