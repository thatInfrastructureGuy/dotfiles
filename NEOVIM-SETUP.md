# Neovim Configuration Setup

This directory contains a portable Neovim configuration that works on both macOS and Linux.

## Quick Install

### On macOS or Debian (with Linuxbrew)

```bash
# Install Homebrew (if not already installed)
# macOS: Already have it
# Linux: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Run the installation script
cd ~/.local/share/chezmoi
./install-nvim-deps.sh
```

## Manual Installation

### 1. Install Brew Dependencies

```bash
brew bundle --file=~/.local/share/chezmoi/common.Brewfile
```

This installs:
- neovim
- gcc (for Treesitter)
- git
- ripgrep, fzf, fd (search tools)
- gopls, lua-language-server, terraform-ls (LSP servers)
- node, python (for additional LSPs)
- tmux, gh, curl, wget (optional tools)

### 2. Install Node/Python LSP Servers

```bash
# TypeScript/JavaScript LSP
npm install -g typescript-language-server typescript

# Python LSP
pip3 install --user pyright
```

### 3. Setup Neovim Config

```bash
# Copy or link the config
ln -s ~/.local/share/chezmoi/nvim_tig ~/.config/nvim

# Or if managing with chezmoi:
chezmoi apply
```

### 4. Launch Neovim

```bash
nvim
```

Lazy.nvim will automatically:
- Install all plugins on first launch
- Install Treesitter parsers (bash, python, go, typescript, lua, etc.)

**Note**: First launch may take a minute while parsers compile. Be patient!

## What Gets Installed

### Plugins (auto-installed by lazy.nvim)
- **fzf-lua**: Fuzzy finder
- **nvim-treesitter**: Syntax highlighting
- **nvim-lspconfig**: LSP support
- **blink.cmp**: Autocompletion
- **oil.nvim**: File explorer
- **mini.nvim**: UI components (statusline, git, diff, etc.)
- **which-key**: Keybinding hints
- **undotree**: Undo history
- **vim-tmux-navigator**: Tmux integration
- **oxocarbon**: Colorscheme

### LSP Servers (installed via brew/npm/pip)
- **gopls**: Go
- **lua_ls**: Lua
- **pyright**: Python
- **ts_ls**: TypeScript/JavaScript
- **terraformls**: Terraform

### Treesitter Parsers (installed via :TSInstall)
- bash, dockerfile, python, typescript, javascript
- lua, vim, vimdoc
- html, terraform, go, yaml

## Configuration Features

### Lazy Loading
- Plugins only load when needed
- Treesitter loads on file open
- LSPs load per file type
- Fast startup time

### File Type Support
- **Go**: LSP (gopls) + Treesitter
- **Lua**: LSP (lua_ls) + Treesitter
- **Python**: LSP (pyright) + Treesitter
- **TypeScript/JavaScript**: LSP (ts_ls) + Treesitter
- **Terraform**: LSP (terraformls) + Treesitter
- **YAML**: Treesitter syntax highlighting
- **Bash/Shell**: Treesitter
- **HTML**: Treesitter

### Key Features
- Press `-` to open file explorer (Oil)
- `<leader>ff` to search files (FzF)
- `<leader>fg` to search in files (ripgrep)
- `gd` to go to definition (LSP)
- Automatic syntax highlighting
- Git signs in gutter
- Autocompletion

## Troubleshooting

### Syntax highlighting not working?
```vim
:lua vim.treesitter.start()
:TSInstallInfo
```

### LSP not starting?
```vim
:LspInfo
:checkhealth lsp
```

### Check installed tools
```bash
which gopls lua-language-server terraform-ls
which rg fzf fd
npm list -g typescript-language-server
pip3 list | grep pyright
```

## Platform Differences

| Feature | macOS | Debian/Linux |
|---------|-------|--------------|
| Homebrew | Native | Linuxbrew |
| Config Location | `~/.config/nvim` | `~/.config/nvim` |
| Data Directory | `~/.local/share/nvim` | `~/.local/share/nvim` |
| LSP Installation | Same commands | Same commands |

The configuration is 100% portable between macOS and Linux when using Homebrew/Linuxbrew!
