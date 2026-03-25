#!/bin/bash
# Install all Neovim dependencies
# Works on both macOS and Linux (with Linuxbrew)

set -e

echo "📦 Installing dependencies from common.Brewfile..."
brew bundle --file="$(dirname "$0")/common.Brewfile"

echo ""
echo "📦 Installing Node.js LSP servers..."
npm install -g typescript-language-server typescript

echo ""
echo "📦 Installing Python LSP server..."
pip3 install --user pyright

echo ""
echo "✅ All dependencies installed!"
echo ""
echo "Next steps:"
echo "1. Copy/link your Neovim config:"
echo "   ln -s ~/.local/share/chezmoi/nvim_tig ~/.config/nvim"
echo ""
echo "2. Launch Neovim:"
echo "   nvim"
echo ""
echo "   Lazy.nvim will automatically:"
echo "   - Install all plugins"
echo "   - Install Treesitter parsers"
echo "   - Set up LSP servers"
echo ""
echo "   ⏳ First launch takes ~1 minute while parsers compile. Be patient!"
