if status is-interactive
and not set -q TMUX
    exec tmux
end

set -Ux ANDROID_HOME /opt/android-sdk
set -Ux ANDROID_NDK_ROOT /opt/android-sdk/ndk/21.0.6113669

set PATH $ANDROID_HOME/tools $PATH
set PATH $ANDROID_HOME/platform-tools $PATH

set PATH /home/kayak/.local/bin $PATH

alias yi="yay -Syu --noconfirm"
alias work-here="subl . && smerge ."

function zeal-docs-fix
    pushd "$HOME/.local/share/Zeal/Zeal/docsets" >/dev/null || return
    find . -iname 'react-main*.js' -exec rm '{}' \;
    popd >/dev/null || exit
end

thefuck --alias | source

set PATH (ruby -e 'puts Gem.user_dir')/bin $PATH

. "$HOME/.homesick/repos/homeshick/homeshick.fish"
source "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"

