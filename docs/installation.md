---
layout: default
title: Installation Guide
---

# Installation Guide

This page guides you through installing and configuring Kaggle-MCP.

## Requirements

Before installing, make sure you have:

- Python 3.8 or newer
- Claude Desktop or API access
- A Kaggle account with API credentials
- MCP Python SDK 1.6.0+

## Installation Methods

### Quick Installation (Recommended)

#### macOS / Linux

```bash
# Install with a single command
curl -LsSf https://raw.githubusercontent.com/54yyyu/kaggle-mcp/main/install.sh | sh
```

#### Windows

```powershell
# Download and run the installer
powershell -c "Invoke-WebRequest -Uri https://raw.githubusercontent.com/54yyyu/kaggle-mcp/main/install.ps1 -OutFile install.ps1; .\install.ps1"
```

### Manual Installation

If you prefer more control over the installation process:

```bash
# Install with pip
pip install git+https://github.com/54yyyu/kaggle-mcp.git

# Or better, install with uv
uv pip install git+https://github.com/54yyyu/kaggle-mcp.git
```

## Configuration

After installation, run the setup utility to configure Claude Desktop:

```bash
kaggle-mcp-setup
```

This will locate and update your Claude Desktop configuration file with the necessary settings to use Kaggle-MCP.

### Claude Desktop Configuration Locations

The configuration file is typically found at:
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
- Linux: `~/.config/Claude/claude_desktop_config.json`

### Manual Configuration

Alternatively, you can manually add the following to your Claude Desktop configuration file:

```json
{
  "mcpServers": {
    "kaggle": {
      "command": "kaggle-mcp"
    }
  }
}
```

## Upgrading

To upgrade to the latest version:

```bash
pip install --upgrade git+https://github.com/54yyyu/kaggle-mcp.git
```

## Uninstallation

If you need to uninstall Kaggle-MCP:

### macOS / Linux

```bash
# Run the uninstall script
curl -LsSf https://raw.githubusercontent.com/54yyyu/kaggle-mcp/main/uninstall.sh | sh
```

### Manual Uninstallation

```bash
# Uninstall via pip
pip uninstall kaggle-mcp

# Remove from Claude Desktop configuration
# Edit your Claude Desktop configuration file and remove the "kaggle" entry from mcpServers
```

## Troubleshooting

### Common Issues

1. **Authentication problems**: Ensure your Kaggle API credentials are properly set up in `~/.kaggle/kaggle.json`

2. **Claude Desktop can't find kaggle-mcp**: Make sure the command was installed in a location that's in your PATH. The setup helper should use the full path, but you can also manually specify the full path in your Claude configuration.

3. **Permission errors**: On Unix-like systems, ensure your credential file has the right permissions:
   ```bash
   chmod 600 ~/.kaggle/kaggle.json
   ```

4. **Path issues**: If you encounter download path problems, explicitly set the path with:
   ```
   config_path("/your/preferred/path")
   ```

For any other issues, please check the [GitHub repository](https://github.com/54yyyu/kaggle-mcp/issues) for known issues or to report a new one.
