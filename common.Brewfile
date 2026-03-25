# Common Brewfile for Neovim Configuration
# Works on both macOS and Linux (Linuxbrew)
# Install with: brew bundle --file=common.Brewfile

# Core Editor
brew "neovim"

# Build Tools (required for Treesitter parser compilation)
brew "gcc"
brew "git"

# Search and File Navigation Tools
brew "ripgrep"       # Fast grep alternative (used by fzf-lua)
brew "fzf"           # Fuzzy finder
brew "fd"            # Fast find alternative

# LSP Servers
brew "gopls"                    # Go language server
brew "lua-language-server"      # Lua language server
brew "terraform-ls"             # Terraform language server

# Node.js (required for TypeScript/JavaScript LSP)
brew "node"

# Python (required for pyright LSP)
# Note: python@3 is a rolling release that auto-updates to latest Python 3.x
# The symlink at ${BREW_PREFIX}/opt/python@3 always points to the latest version
brew "python@3"

# Optional but Recommended
brew "tmux"          # Terminal multiplexer (for vim-tmux-navigator)
brew "gh"            # GitHub CLI (for PR management in config)
brew "curl"          # For downloading plugins/tools
brew "wget"          # Alternative downloader

# Post-install: These LSP servers need npm/pip (run install-nvim-deps.sh to auto-install):
#   npm install -g typescript-language-server typescript
#   pip3 install pyright
#
# After setup, launch nvim - plugins and treesitter parsers auto-install!
