typeset -U path PATH
[[ -d "$HOMEBREW_PREFIX/opt/python@3.10/libexec/bin" ]] && path=("$HOMEBREW_PREFIX/opt/python@3.10/libexec/bin" $path)
[[ -d "$ANDROID_HOME/platform-tools" ]] && path+=("$ANDROID_HOME/platform-tools")
[[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)
export PATH
