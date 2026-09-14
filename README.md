# dotfiles

仓库根 = `~/.config`。装新软件、搬迁工具按下面走。

## 1. 动手之前

```bash
command -v <tool> && <tool> --version                                    # 确认已安装
strings "$(command -v <tool>)" | grep -iE 'XDG_|_HOME|_CONFIG|_CACHE'    # 确认支持 XDG
```

**没装就不写变量、不加 gitignore。** 变量指向不存在的路径不报错，只静默失效。
不支持 XDG 的工具不要硬写变量 —— 接受现状，或用符号链接。

翻二进制比查文档可靠。

## 2. 加变量

环境变量写 `~/.config/zsh/.zshenv`；只有登录 shell 用得着的（`brew shellenv` 这种）写 `~/.config/zsh/.zprofile`。`~/.zshenv` 只是引导器，配置别放那儿（不在仓库里，不会版本化）。

```zsh
# 工具名

export TOOL_CONFIG_HOME="$XDG_CONFIG_HOME/tool"
```

一行分组注释，不写"为什么"。引用已有的 `$XDG_CONFIG_HOME`，不要重复写 `$HOME/.config`。

```bash
zsh -n ~/.config/zsh/.zshenv
```

## 3. 搬已有数据

```bash
ls -la ~/.<tool>                                                        # 有什么
ls -la ~/.<tool> | grep -iE 'auth|token|credential|secret|\.key|\.pem'  # 凭据（只看文件名）
ls -d ~/.config/<tool> 2>/dev/null                                      # 目标是否已存在
pgrep -fl <tool>                                                        # 确认没在跑
mv ~/.<tool> ~/.config/<tool>
```

`~/.config` 是仓库工作区，搬进来就落在工作区内。**有凭据必须先定它进不进仓库：** 可能在独立文件里（`auth.json`），也可能内嵌在配置字段里（如 Claude 的 `settings.json`）——后者没法只 ignore 一半。

```bash
git -C ~/.config check-ignore -v <路径>    # 加完规则必须验证真的命中
```

## 4. 验证

```bash
zsh -n ~/.config/zsh/.zshenv
zsh -c 'echo $TOOL_CONFIG_HOME'            # 真·新 shell，不是当前会话
<tool> --version && <tool> <只读子命令>     # 登录态 / 设置 / 历史都还在
ls -d ~/.<tool> 2>/dev/null || echo 干净    # 旧路径没被重新创建
```

最后一条最常被跳过，也最要紧：旧路径又出现 = 工具根本没读你设的变量。

## 5. 不要做

- 不装的工具不写变量、不加 gitignore
- 不用没查证的变量名
- 不把凭据放进任何会被提交的文件
- 不用 `git clean -fd`（在 `~/.config` 里是毁灭性操作）
- 不动 `~/.ssh`、`~/.bashrc`、`~/Library/Caches/Homebrew`
