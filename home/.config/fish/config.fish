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
