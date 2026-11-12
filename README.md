# macOS dotfiles

配置仓库位于 `~/.config`，采用 XDG 目录分类、Git 白名单和模块化 Zsh 配置。
这里保存可复用的设置；登录凭据、工具安装和运行数据需要另行管理。

## 目录职责

| 目录 | 内容 | 是否纳入本仓库 |
|---|---|---|
| `~/.config` | Zsh、Neovim、Kitty、Git 等配置 | 仅明确放行的配置 |
| `~/.local/share` | nvm、Gradle、Neovim 等持久数据 | 否 |
| `~/.local/state` | 历史、日志、旧配置备份 | 否 |
| `~/.cache` | 可重建缓存 | 否 |

应用在 `.config` 中保存的本地状态仍留在原位，通过 Git 忽略处理。
不支持 XDG 的应用可以保留原生位置，包括 macOS 的 `~/Library`。

## Zsh 加载关系

```text
~/.zshenv                         ← 从 zsh/bootstrap.zshenv 部署的引导文件
└── $XDG_CONFIG_HOME/zsh/.zshenv  ← XDG 默认值及轻量环境变量
    ├── .zprofile                ← 登录 Shell；调用 Homebrew 公共模块
    └── .zshrc                   ← 交互 Shell；调用 Homebrew 公共模块
        ├── Oh My Zsh 与主题
        ├── modules/path.zsh     ← 路径检查、去重
        ├── modules/tools.zsh    ← nvm、Conda
        ├── modules/history.zsh
        ├── modules/fzf.zsh
        ├── modules/fzf-tab.zsh
        ├── modules/local.zsh    ← 可选、不提交
        ├── p10k.zsh
        └── ~/.local/env         ← 存在才加载的工具环境脚本
```

- XDG 变量保留外部已有值，未设置时使用上表中的默认目录。
- `modules/homebrew.zsh` 由登录和交互入口共享，检查环境后按需初始化。
- 纯非交互、非登录脚本不加载交互工具，需自行明确工具路径。
- 缺少 Oh My Zsh 时提示并启用基本补全；fzf 和 fzf-tab 依赖缺失时跳过。
- LLVM 编译参数按项目设置，不在 `.zshenv` 中覆盖所有项目的环境。
- GUI 应用可能不继承 Zsh 环境，需单独验证配置是否生效。

## 安装新软件后

1. 正常安装并启动一次，查阅软件文档确认配置位置及支持的环境变量。
2. 判断是否需要保存配置。不要为了目录整齐直接搬迁整个应用数据目录。
3. 检查配置是否包含登录令牌、密钥、账号状态等；文件名检查只能辅助判断。
4. 按需加入 Git 白名单，重启软件验证，再查看待提交内容。

新目录默认被忽略。若只需保存 `example/config.toml`，在 `.gitignore`
的白名单区域、通用凭据排除规则之前添加：

```gitignore
!/example/
/example/*
!/example/config.toml
```

即使文件被放行，也不能包含凭据；凭据与设置混在同一文件时应整份排除。
已放行目录中的新文件可能自动成为待添加文件，仍需检查。
`.gitignore` 不会取消已经追踪的文件。

```bash
git -C ~/.config status --short
git -C ~/.config check-ignore -v -- example/config.toml
git -C ~/.config diff -- example/config.toml
```

`check-ignore -v` 显示命中的规则，注意以 `!` 开头的是放行规则。
`git diff` 不显示未追踪文件的内容；暂存前需另行检查它们。

### 需要修改 Shell 时

| 需求 | 文件 |
|---|---|
| 软件确认支持的环境变量 | `zsh/.zshenv` |
| 可执行文件搜索路径 | `zsh/modules/path.zsh` |
| 交互初始化或补全 | `zsh/modules/tools.zsh` 或独立模块 |
| 本机专用设置 | `zsh/modules/local.zsh` |

新增独立模块后，需要在 `.zshrc` 的加载列表中登记。
不要为未安装的软件预设变量，也不要猜测变量名。
二进制中的字符串只能提供线索，最终要验证软件实际读取的路径。

迁移现有数据前先退出软件、备份并检查目标目录，避免覆盖已有内容。
迁移后分别验证终端和 GUI 的设置、历史与登录状态。
旧目录重新出现是排查线索，不能仅凭这一点断定迁移完全失败。

## 新机器恢复

1. 先将仓库检出到临时目录，与已有 `~/.config` 对比后合并；不要直接覆盖现有配置。
2. 安装实际需要的工具。本机配置主要按 Apple Silicon Homebrew 路径编写，
   尤其 `tools.zsh` 中的 nvm、Conda 路径，换机器时需核对。
3. 若使用完整交互体验，单独安装 Oh My Zsh 到 `~/.oh-my-zsh`，以及
   powerlevel10k 主题、zsh-autosuggestions、zsh-syntax-highlighting 插件。
   fzf、fzf-tab、nvm、Conda 按使用需求安装。
4. 备份原 `~/.zshenv`，再部署引导文件。以下示例适用于默认配置目录：

```bash
backup_dir="$HOME/.local/state/dotfiles/backups/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"
if [ -e "$HOME/.zshenv" ]; then
  cp -p "$HOME/.zshenv" "$backup_dir/.zshenv"
fi
cp "$HOME/.config/zsh/bootstrap.zshenv" "$HOME/.zshenv"
```

使用自定义 `XDG_CONFIG_HOME` 时，配置必须位于相应目录，且该变量需在
Shell 启动前可用，或在本机引导文件中明确设置。

5. 如需本机覆盖，复制 `zsh/modules/local.example.zsh` 为 `local.zsh`；不要覆盖已有文件。
6. 新开终端并完成下方验证。确认 `ZDOTDIR` 生效后，再核对、备份和归档旧入口。

仓库不恢复登录凭据、SDK、模型、插件数据或工具安装。

## 修改后验证

```bash
# 语法检查示例；其他改动过的模块也需逐一检查
zsh -n ~/.config/zsh/.zshenv
zsh -n ~/.config/zsh/.zprofile
zsh -n ~/.config/zsh/.zshrc

# 在真实终端检查不同启动方式
zsh -c 'print -r -- "$ZDOTDIR"'
zsh -lc 'command -v brew'
zsh -ic 'command -v brew fzf'
zsh -lic 'command -v brew fzf'

# 提交前检查
git -C ~/.config diff --check
git -C ~/.config diff
git -C ~/.config status --short
```

缺少未安装的可选工具时，`command -v` 找不到它是正常现象。
还需实际体验 Ctrl+R 搜索、Tab 补全及所改应用的功能；语法通过不等于功能验收。
暂存后用 `git diff --cached` 再核对一次，明确选择文件提交。

## 维护边界

- 不提交凭据，不用 `git add -f` 绕过本地数据的忽略规则。
- 不在此目录盲目执行 `git clean`，尤其不要带 `-x` 清除被忽略的本地数据。
- 不随意移动 `~/.ssh`、其他 Shell 配置或 macOS 原生应用数据。
- 提交只写本地历史；推送远端需单独决定。
