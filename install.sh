#!/bin/bash
# Simple installation script for kaggle-mcp

# Install the package
pip install -e .

# Check if Kaggle is properly configured
if [ ! -f ~/.kaggle/kaggle.json ]; then
    echo "WARNING: Kaggle API credentials not found at ~/.kaggle/kaggle.json"
    echo "You will need to set up your Kaggle API credentials before using this tool."
    echo "Visit https://www.kaggle.com/settings/account and click 'Create New API Token'"
    echo "Then save the downloaded kaggle.json file to ~/.kaggle/kaggle.json"
    echo "Make sure to run: chmod 600 ~/.kaggle/kaggle.json"
fi

# Information about Claude Desktop setup
echo ""
echo "To configure Claude Desktop with kaggle-mcp:"
echo "1. Edit your Claude Desktop configuration file at:"
echo "   - macOS: ~/Library/Application Support/Claude/claude_desktop_config.json"
echo "   - Windows: %APPDATA%\\Claude\\claude_desktop_config.json"
echo ""
echo "2. Add the following configuration:"
cat claude_config_example.md | grep -A6 '```json' | grep -v '```'
echo ""
echo "3. Restart Claude Desktop"
echo ""
echo "Installation complete! You can now use Kaggle MCP with Claude Desktop."
then
  # Check permissions
  PERMS=$(stat -c "%a" "$KAGGLE_JSON" 2>/dev/null || stat -f "%Lp" "$KAGGLE_JSON" 2>/dev/null)
  if [ "$PERMS" != "600" ]; then
    warn "Your Kaggle API credentials file has incorrect permissions."
    warn "For security, the permissions should be set to 600 (user read/write only)."
    
    echo -n "Would you like to fix the permissions now? (Y/n) "
    read -r REPLY
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
      chmod 600 "$KAGGLE_JSON"
      success "Permissions updated for $KAGGLE_JSON"
    fi
  else
    success "Kaggle API credentials found with correct permissions."
  fi
else
  warn "Kaggle API credentials not found at $KAGGLE_JSON"
  warn "You will need to set up your Kaggle API credentials before using this tool."
  warn "Visit https://www.kaggle.com/settings/account and click 'Create New API Token'"
  warn "Then save the downloaded kaggle.json file to ~/.kaggle/kaggle.json"
  warn "Make sure to run: chmod 600 ~/.kaggle/kaggle.json"
  warn "Alternatively, you can authenticate directly using Claude with the authenticate() tool."
fi

# Configure Claude Desktop
info "Running setup helper to configure Claude Desktop..."
if command_exists kaggle-mcp-setup; then
  kaggle-mcp-setup
else
  warn "Could not find kaggle-mcp-setup command."
  warn "You may need to manually configure Claude Desktop."
  warn "Add the following to your Claude Desktop config file:"
  echo ""
  echo '{
  "mcpServers": {
    "kaggle": {
      "command": "kaggle-mcp"
    }
  }
}'
  echo ""
fi

echo ""
echo -e "${BLUE}=== Getting Started ===${NC}"
echo ""
echo "To use Kaggle-MCP with Claude Desktop:"
echo ""
echo "1. Start Claude Desktop"
echo "2. Claude will have access to Kaggle API commands"
echo "3. First authenticate with your credentials by asking Claude:"
echo "   \"Please authenticate with Kaggle using my username 'yourusername' and key 'yourapikey'\""
echo ""
echo "4. Then try commands like:"
echo "   - \"List active Kaggle competitions\""
echo "   - \"Find datasets about climate change\""
echo "   - \"Search for kernels about sentiment analysis\""
echo ""

success "Installation complete!"
