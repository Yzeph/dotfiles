if [[ -r "$ZDOTDIR/modules/homebrew.zsh" ]]; then
  source "$ZDOTDIR/modules/homebrew.zsh"
else
  print -u2 -- "zsh: missing module: $ZDOTDIR/modules/homebrew.zsh"
fi
export HOMEBREW_API_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/api
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles
export HOMEBREW_PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/
