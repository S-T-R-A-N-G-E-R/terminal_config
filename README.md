<div align="center">

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:0a0f1e,50:0d2137,100:00d4ff&height=200&section=header&text=MLOps%20Terminal%20Environment&fontSize=42&fontColor=ffffff&fontAlignY=38&desc=The%20Ultimate%20Dotfiles%20for%20Data%20Science%20%26%20MLOps&descSize=16&descAlignY=58&descColor=7ec8e3"/>

<br/>

[![Warp](https://img.shields.io/badge/Terminal-Warp-1a1a2e?style=for-the-badge&logo=terminal&logoColor=00d4ff&labelColor=0a0f1e)](https://www.warp.dev/)
[![Zsh](https://img.shields.io/badge/Shell-Zsh-1a1a2e?style=for-the-badge&logo=gnubash&logoColor=00d4ff&labelColor=0a0f1e)](https://www.zsh.org/)
[![Starship](https://img.shields.io/badge/Prompt-Starship-1a1a2e?style=for-the-badge&logo=starship&logoColor=dd0b78&labelColor=0a0f1e)](https://starship.rs/)
[![macOS](https://img.shields.io/badge/Platform-macOS-1a1a2e?style=for-the-badge&logo=apple&logoColor=ffffff&labelColor=0a0f1e)](https://www.apple.com/macos/)
[![Homebrew](https://img.shields.io/badge/Packages-Homebrew-1a1a2e?style=for-the-badge&logo=homebrew&logoColor=fbb040&labelColor=0a0f1e)](https://brew.sh/)
[![Rust](https://img.shields.io/badge/Tooling-Rust--based-1a1a2e?style=for-the-badge&logo=rust&logoColor=ff6b35&labelColor=0a0f1e)](https://www.rust-lang.org/)

<br/>

> _Transforming the default macOS terminal into a blazing-fast, highly visual, and exceptionally powerful workspace tailored for Machine Learning Operations and Data Science._

<br/>

</div>

---

## `$ cat objectives.md`

<table>
<tr>
<td width="25%" align="center"><br/>⚡<br/><br/><b>Zero Friction</b><br/><br/><sub>Eliminate repetitive typing with intelligent aliases and smart directory jumping</sub><br/><br/></td>
<td width="25%" align="center"><br/>🎨<br/><br/><b>Visual Feedback</b><br/><br/><sub>Rich, colorized output for code, data, and system resources directly in the terminal</sub><br/><br/></td>
<td width="25%" align="center"><br/>🤖<br/><b>Env Automation</b><br/><br/><sub>Seamlessly manage Python/Conda environments without prompt clutter</sub><br/><br/></td>
<td width="25%" align="center"><br/>♾️<br/><br/><b>Reproducibility</b><br/><br/><sub>Instant recreation on any new macOS machine, or safe integration in minutes</sub><br/><br/></td>
</tr>
</table>

---

## `$ brew bundle list`

The included `Brewfile` acts as a package manager blueprint. One command installs everything.

<br/>

### 〔 01 〕 Core Terminal Enhancements

> Replacing legacy Unix commands from the 1970s with modern, Rust-based alternatives.

| Tool                                                | Cmd        | Purpose                                                                                                 |
| --------------------------------------------------- | ---------- | ------------------------------------------------------------------------------------------------------- |
| **[Starship](https://starship.rs/)**                | `starship` | Cross-shell prompt with Git status, Python version, and Cloud context. Informative but never cluttered. |
| **[Zoxide](https://github.com/ajeetdsouza/zoxide)** | `zoxide`   | A smarter `cd`. Remembers frequent dirs — type `z proj` instead of the full path.                       |
| **[Eza](https://github.com/eza-community/eza)**     | `eza`      | Modern `ls` with color-coding, Git integration, and file icons. Aliased to `ls`, `ll`, and `tree`.      |
| **[Bat](https://github.com/sharkdp/bat)**           | `bat`      | `cat` with syntax highlighting and Git integration. Reading Python or JSON is actually readable now.    |
| **[Fzf](https://github.com/junegunn/fzf)**          | `fzf`      | General-purpose fuzzy finder. Instantly search files, command history, and directories.                 |

<br/>

### 〔 02 〕 God-Tier TUIs

> Graphical applications are slow. These TUIs keep you in the terminal without sacrificing visual usability.

| Tool                                                          | Cmd          | Purpose                                                                                                       |
| ------------------------------------------------------------- | ------------ | ------------------------------------------------------------------------------------------------------------- |
| **[Lazygit](https://github.com/jesseduffield/lazygit)**       | `lazygit`    | Full Git UI in your terminal. Stage individual lines, resolve conflicts, manage branches — zero memorization. |
| **[Lazydocker](https://github.com/jesseduffield/lazydocker)** | `lazydocker` | Same brilliant interface, but for Docker containers, images, and volumes.                                     |
| **[Btop](https://github.com/aristocratos/btop)**              | `btop`       | Cyberpunk-styled resource monitor. Far superior to `top` for tracking CPU and RAM during model training.      |
| **[K9s](https://k9scli.io/)**                                 | `k9s`        | Kubernetes terminal dashboard. Navigate deployments, view pod logs, and shell into containers.                |

<br/>

### 〔 03 〕 Data & API Tools

> Designed specifically to make handling data streams, APIs, and databases painless.

| Tool                                                                           | Cmd         | Purpose                                                                                             |
| ------------------------------------------------------------------------------ | ----------- | --------------------------------------------------------------------------------------------------- |
| **[HTTPie](https://httpie.io/)**                                               | `httpie`    | Modern `curl` replacement — intuitive syntax, automatic JSON formatting, colorized responses.       |
| **[VisiData](https://visidata.org/)**                                          | `visidata`  | Terminal spreadsheet. Open massive CSVs, JSON, or SQLite databases without writing a Pandas script. |
| **[Harlequin](https://harlequin.sh/)**                                         | `harlequin` | Terminal SQL IDE with syntax highlighting and a data catalog sidebar.                               |
| **[jq](https://jqlang.github.io/jq/) & [yq](https://github.com/mikefarah/yq)** | `jq` / `yq` | JSON & YAML processors. Essential for parsing API responses or manipulating Kubernetes manifests.   |

<br/>

### 〔 04 〕 Workspace & Workflow

| Tool                                      | Cmd      | Purpose                                                                                               |
| ----------------------------------------- | -------- | ----------------------------------------------------------------------------------------------------- |
| **[Zellij](https://zellij.dev/)**         | `zellij` | Modern `tmux`. Split panes, detach/reattach to long-running scripts so they survive connection drops. |
| **[GitHub CLI](https://cli.github.com/)** | `gh`     | Manage PRs, issues, and repo creation without ever opening a browser.                                 |

---

## `$ ./install.sh`

### Prerequisites

Before choosing a method, ensure **Homebrew** is installed, then clone this repo:

```zsh
# Install Homebrew
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"

# Clone and install all tools
git clone [https://github.com/YOUR-USERNAME/terminal_config.git](https://github.com/YOUR-USERNAME/terminal_config.git) ~/dotfiles
cd ~/dotfiles
brew bundle

```

---

### ◆ Method A — Clean Slate

_For a fresh Mac with no existing configuration._

**Step 1 — Clear Default Configs**

```zsh
rm -f ~/.zshrc
rm -f ~/.config/starship.toml
mkdir -p ~/.config

```

**Step 2 — Create Symlinks**

```zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml

```

**Step 3 — Apply & Enjoy**

```zsh
source ~/.zshrc

```

---

### ◆ Method B — Safe Install

_For experienced developers with existing configs — non-destructive._

**Step 1 — Link Starship Theme**

```zsh
mkdir -p ~/.config
mv ~/.config/starship.toml ~/.config/starship_backup.toml 2>/dev/null || true
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml

```

**Step 2 — Source into Existing `.zshrc**`

```zsh
echo "source ~/dotfiles/.zshrc" >> ~/.zshrc

```

**Step 3 — Apply & Enjoy**

```zsh
source ~/.zshrc

```

---

## `$ cat warp_setup.md`

<table>
<tr>
<td>

**🚀 Warp Terminal Integration**

This entire workspace is optimized to run inside [Warp](https://www.warp.dev/), a modern Rust-based terminal. By default, Warp overrides custom shell prompts with its own UI. To pass full control back to Starship, you must adjust Warp's input settings:

1. Open Warp Settings (`Cmd + ,`)
2. Navigate to **Appearance > Input**
3. Change the dropdown to **Shell prompt (PS1)**
4. Check the box for **Same line**

_Note: If the default folder icon still appears, right-click the input prompt area, select "Edit prompt", and choose "Shell (PS1)"._

</td>
</tr>
</table>

---

## `$ cat config_notes.md`

<table>
<tr>
<td width="50%">

**🐍 Smart Conda Wrapper**

The `.zshrc` includes a custom wrapper that intercepts `conda create` and prompts you to auto-generate a `.envrc` file — integrating with `direnv` for automatic environment activation when you `cd` into a project directory.

</td>
<td width="50%">

**✨ Clean Prompting**

The `starship.toml` is tuned to remove unnecessary brackets, leaving only clean icons and essential path/git context. Conda's native `(base)` hijacking is disabled in favor of Starship's cleaner handling.

```zsh
conda config --set auto_activate_base false

```

</td>
</tr>
</table>

---

## `$ brew bundle dump`

If you install a new tool via Homebrew and want it permanently tracked:

```zsh
cd ~/dotfiles
brew bundle dump -f   # regenerate Brewfile
git add Brewfile
git commit -m "chore: update Brewfile"
git push

```

---

<div align="center">

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:00d4ff,50:0d2137,100:0a0f1e&height=120&section=footer"/>

_Built for speed. Built for the terminal._

</div>
