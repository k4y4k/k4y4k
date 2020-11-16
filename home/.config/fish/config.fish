if status is-interactive
and not set -q TMUX
    exec tmux
end

set -Ux ANDROID_HOME /opt/android-sdk
set -Ux ANDROID_NDK_ROOT /opt/android-sdk/ndk/21.0.6113669

set PATH $ANDROID_HOME/tools $PATH
set PATH $ANDROID_HOME/platform-tools $PATH

set PATH /home/kayak/.local/bin $PATH

alias yi="yay -Syu --noconfirm --sudoloop"
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

function git --wraps hub --description 'Alias for hub, which wraps git to provide extra functionality with GitHub.'
  hub $argv
end

alias lss="exa -a --grid --long"

homeshick --quiet refresh 2

alias shut-up="dunstctl close-all"
alias zz="shut-up"
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
