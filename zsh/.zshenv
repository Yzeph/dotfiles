# Sourced by ~/.zshenv (bootstrap)
# XDG Base Directory Standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# nvm
export NVM_DIR="$XDG_DATA_HOME/nvm"

# NuGet (not installed yet)
export NUGET_PACKAGES="$XDG_DATA_HOME/NuGet/packages"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# Conda
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"

# MySQL
export MYSQL_HISTFILE="$XDG_STATE_HOME/mysql_history"

# Matplotlib
export MPLCONFIGDIR="$XDG_CACHE_HOME/matplotlib"

# Python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup.py"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_UPDATE_REPORT_NEW=1

# LLVM
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# HISTFILE/HISTSIZE/SAVEHIST live in .zshrc; macOS /etc/zshrc overwrites
# values set here (no -z guard), and non-interactive shells don't need them.