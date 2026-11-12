# fzf-tab requires both fzf and its plugin file.
if (( $+commands[fzf] )) && [[ -r "$HOMEBREW_PREFIX/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
  zstyle ':fzf-tab:*' use-fzf-default-opts yes
fi
