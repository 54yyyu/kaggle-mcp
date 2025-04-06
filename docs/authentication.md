---
layout: default
title: Authentication
---

# Authentication

Before using Kaggle-MCP, you need to authenticate with the Kaggle API. This page explains the authentication process and available methods.

## Kaggle API Credentials

To use Kaggle-MCP, you need to set up your Kaggle API credentials:

1. Go to your [Kaggle account settings](https://www.kaggle.com/settings/account)
2. In the API section, click "Create New API Token"
3. This will download a `kaggle.json` file with your credentials
4. Move this file to `~/.kaggle/kaggle.json` (create the directory if needed)
5. Set the correct permissions: `chmod 600 ~/.kaggle/kaggle.json`

## Authentication Through Claude

You can authenticate directly through Claude using the `authenticate()` tool:

```
authenticate(username, key)
```

**Parameters:**
- `username`: Your Kaggle username
- `key`: Your Kaggle API key

**Returns:** Success message or error details

## Authentication Status

Most Kaggle-MCP tools automatically check if you're authenticated and will prompt you to authenticate if needed. The API will automatically look for credentials in:

1. Environment variables (`KAGGLE_USERNAME` and `KAGGLE_KEY`)
2. The `~/.kaggle/kaggle.json` file
3. The `~/.config/kaggle/kaggle.json` file (alternative location)

## Credential Security

Your Kaggle API credentials grant full access to your Kaggle account, so it's important to keep them secure:

- Never share your API key with others
- Ensure your credential file has restricted permissions (`chmod 600 ~/.kaggle/kaggle.json`)
- Don't include your API key in notebooks or code repositories

## Examples

Here's an example of how to authenticate with Kaggle-MCP through Claude:

```
# Authenticate with Kaggle using your credentials
authenticate("your_username", "your_api_key") 
```

Where `your_username` and `your_api_key` are replaced with your actual Kaggle credentials.
