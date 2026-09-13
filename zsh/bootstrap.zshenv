# Not sourced by zsh — sync manually: cp ~/.config/zsh/bootstrap.zshenv ~/.zshenv

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
[[ -f "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv"
