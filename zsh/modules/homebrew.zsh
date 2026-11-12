# Shared by login and interactive shells.
if [[ -z "$HOMEBREW_PREFIX" || ! -x "$HOMEBREW_PREFIX/bin/brew" ]] || (( ! $+commands[brew] )); then
  for _brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    if [[ -x "$_brew_bin" ]]; then
      eval "$("$_brew_bin" shellenv)"
      break
    fi
  done
  unset _brew_bin
fi
