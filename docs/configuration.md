---
layout: default
title: Configuration API
---

# Configuration API

Kaggle-MCP provides tools to view and manage Kaggle API configuration settings.

## Available Tools

### config_view

View current Kaggle API configuration values.

```
config_view()
```

**Returns:** JSON string with current configuration values

### config_set

Set a Kaggle API configuration value.

```
config_set(name, value)
```

**Parameters:**
- `name`: Name of the configuration parameter (one of: competition, path, proxy)
- `value`: Value to set for the configuration parameter

**Returns:** Success message or error details

### config_unset

Clear a Kaggle API configuration value.

```
config_unset(name)
```

**Parameters:**
- `name`: Name of the configuration parameter to clear (one of: competition, path, proxy)

**Returns:** Success message or error details

### config_path

Set or view the path where files will be downloaded.

```
config_path(path="")
```

**Parameters:**
- `path`: Optional folder path to set as download location, defaults to current working directory if not provided

**Returns:** Current or updated download path

## Examples

Here are some examples of how to use the configuration tools with Claude:

```
# View current configuration
config_view()

# Set a specific competition as the default
config_set("competition", "titanic")

# Set the download path
config_path("/path/to/downloads")

# Clear a configuration value
config_unset("competition")
```

## Environment Variables

Kaggle-MCP respects the following environment variables:

- `KAGGLE_USERNAME`: Your Kaggle username
- `KAGGLE_KEY`: Your Kaggle API key
- `KAGGLE_PATH`: Default download path for files
