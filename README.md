[![MseeP.ai Security Assessment Badge](https://mseep.net/mseep-audited.png)](https://mseep.ai/app/54yyyu-kaggle-mcp)

# Kaggle-MCP: Kaggle API Integration for Claude AI

```
     ██╗  ██╗ █████╗  ██████╗  ██████╗ ██╗     ███████╗       ███╗   ███╗ ██████╗██████╗ 
     ██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝ ██║     ██╔════╝       ████╗ ████║██╔════╝██╔══██╗
     █████╔╝ ███████║██║  ███╗██║  ███╗██║     █████╗         ██╔████╔██║██║     ██████╔╝
     ██╔═██╗ ██╔══██║██║   ██║██║   ██║██║     ██╔══╝  ████─  ██║╚██╔╝██║██║     ██╔═══╝ 
     ██║  ██╗██║  ██║╚██████╔╝╚██████╔╝███████╗███████╗       ██║ ╚═╝ ██║╚██████╗██║     
     ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝       ╚═╝     ╚═╝ ╚═════╝╚═╝     
```

Kaggle-MCP connects Claude AI to the Kaggle API through the Model Context Protocol (MCP), enabling competition, dataset, and kernel operations through the AI interface.

## Features

- **Authentication**: Securely authenticate with your Kaggle credentials
- **Competitions**: Browse, search, and download data from Kaggle competitions
- **Datasets**: Find, explore, and download datasets from Kaggle
- **Kernels**: Search for and analyze Kaggle notebooks/kernels
- **Models**: Access pre-trained models available on Kaggle

## Quick Installation

The following commands install the base version of Kaggle-MCP.

### macOS / Linux

```bash
# Install with a single command
curl -LsSf https://raw.githubusercontent.com/54yyyu/kaggle-mcp/main/install.sh | sh
```

### Windows

```powershell
# Download and run the installer
powershell -c "Invoke-WebRequest -Uri https://raw.githubusercontent.com/54yyyu/kaggle-mcp/main/install.ps1 -OutFile install.ps1; .\install.ps1"
```

### Manual Installation

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

This will locate and update your Claude Desktop configuration file, which is typically found at:
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
- Linux: `~/.config/Claude/claude_desktop_config.json`

### Manual Configuration

Alternatively, you can manually add the following to your Claude Desktop configuration:

```json
{
  "mcpServers": {
    "kaggle": {
      "command": "kaggle-mcp"
    }
  }
}
```

## Kaggle API Credentials

To use Kaggle-MCP, you need to set up your Kaggle API credentials:

1. Go to your [Kaggle account settings](https://www.kaggle.com/settings/account)
2. In the API section, click "Create New API Token"
3. This will download a `kaggle.json` file with your credentials
4. Move this file to `~/.kaggle/kaggle.json` (create the directory if needed)
5. Set the correct permissions: `chmod 600 ~/.kaggle/kaggle.json`

Alternatively, you can authenticate directly through Claude using the `authenticate()` tool with your username and API key.

## Available Tools

For a comprehensive list of available tools and their detailed usage, please refer to the documentation at [stevenyuyy.us/kaggle-mcp](https://stevenyuyy.us/kaggle-mcp).

## Examples

Ask Claude:

- "Authenticate with Kaggle using my username 'username' and key 'apikey'"
- "List active Kaggle competitions"
- "Show me the top 10 competitors on the Titanic leaderboard"
- "Find datasets about climate change"
- "Download the Boston housing dataset"
- "Search for kernels about sentiment analysis"

## Use Cases

- **Competition Research**: Quickly access competition details, data, and leaderboards
- **Dataset Discovery**: Find and download datasets for analysis projects
- **Learning Resources**: Locate relevant kernels and notebooks for specific topics
- **Model Discovery**: Find pre-trained models for various machine learning tasks

## Requirements

- Python 3.8 or newer
- Claude Desktop or API access
- Kaggle account with API credentials
- MCP Python SDK 1.6.0+

## License

This project is licensed under the MIT License - see the LICENSE file for details.