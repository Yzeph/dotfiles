# p10k instant prompt — must stay first, nothing may print before it
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# /etc/zshrc overwrites these unconditionally — set after it, before oh-my-zsh
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=50000
export SAVEHIST=50000

if [[ -z "$ZSH_COMPDUMP" ]]; then
  _zdotdir_cache="$XDG_CACHE_HOME/zsh"
  [[ -d "$_zdotdir_cache" ]] || mkdir -p "$_zdotdir_cache"
  ZSH_COMPDUMP="$_zdotdir_cache/zcompdump-${SHORT_HOST:-${HOST%%.*}}-${ZSH_VERSION}"
  unset _zdotdir_cache
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting extract web-search)
source $ZSH/oh-my-zsh.sh

for _m in "$ZDOTDIR"/modules/*.zsh(N); do source "$_m"; done

source "$ZDOTDIR/p10k.zsh"
