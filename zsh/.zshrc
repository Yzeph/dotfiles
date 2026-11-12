# p10k instant prompt — must stay first, nothing may print before it
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# /etc/zshrc overwrites these unconditionally — set after it, before oh-my-zsh
export HISTFILE="$XDG_STATE_HOME/zsh/history"
mkdir -p "$XDG_STATE_HOME/zsh" "$XDG_CACHE_HOME/zsh"
export HISTSIZE=50000
export SAVEHIST=50000

if [[ -z "$ZSH_COMPDUMP" ]]; then
  _zdotdir_cache="$XDG_CACHE_HOME/zsh"
  [[ -d "$_zdotdir_cache" ]] || mkdir -p "$_zdotdir_cache"
  ZSH_COMPDUMP="$_zdotdir_cache/zcompdump-${SHORT_HOST:-${HOST%%.*}}-${ZSH_VERSION}"
  unset _zdotdir_cache
fi

if [[ -r "$ZDOTDIR/modules/homebrew.zsh" ]]; then
  source "$ZDOTDIR/modules/homebrew.zsh"
else
  print -u2 -- "zsh: missing module: $ZDOTDIR/modules/homebrew.zsh"
fi
typeset -U path PATH fpath
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Hoomebrew completion (before oh-my-zsh's compinit)
[[ -d "$HOMEBREW_PREFIX/share/zsh/site-functions" ]] && fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting extract web-search)
if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
else
  print -u2 -- "zsh: Oh My Zsh missing; using basic shell"
  autoload -Uz compinit
  compinit -d "$ZSH_COMPDUMP"
fi

# modules, explicit load order
for _zmodule in path tools history fzf fzf-tab; do
  if [[ -r "$ZDOTDIR/modules/$_zmodule.zsh" ]]; then
    source "$ZDOTDIR/modules/$_zmodule.zsh"
  else
    print -u2 -- "zsh: missing module: $ZDOTDIR/modules/$_zmodule.zsh"
  fi
done
unset _zmodule
[[ ! -r "$ZDOTDIR/modules/local.zsh" ]] || source "$ZDOTDIR/modules/local.zsh"
[[ ! -r "$ZDOTDIR/p10k.zsh" ]] || source "$ZDOTDIR/p10k.zsh"
[[ ! -r "$HOME/.local/env" ]] || source "$HOME/.local/env"
