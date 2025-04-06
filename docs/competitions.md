---
layout: default
title: Competitions API
---

# Competitions API

Kaggle-MCP provides comprehensive access to Kaggle competitions functionality, enabling you to browse, join, and submit to competitions directly through Claude.

## Available Tools

### competitions_list

List available Kaggle competitions with filtering options.

```
competitions_list(search="", category="all", group="general", sort_by="latestDeadline", page=1)
```

**Parameters:**
- `search`: Term(s) to search for
- `category`: Filter by category (all, featured, research, recruitment, gettingStarted, masters, playground)
- `group`: Filter by group (general, entered, inClass)
- `sort_by`: Sort by (grouped, prize, earliestDeadline, latestDeadline, numberOfTeams, recentlyCreated)
- `page`: Page number for results paging

**Returns:** JSON string with competition details

### competition_details

Get detailed information about a specific competition.

```
competition_details(competition)
```

**Parameters:**
- `competition`: Competition URL suffix (e.g., 'titanic')

**Returns:** JSON string with competition details

### competition_download_files

Download competition files to a specified location.

```
competition_download_files(competition, path="", file_name="", force=False)
```

**Parameters:**
- `competition`: Competition URL suffix (e.g., 'titanic')
- `path`: Folder where file(s) will be downloaded (defaults to a temp directory)
- `file_name`: File name, all files downloaded if not provided
- `force`: Force download even if files exist

**Returns:** Success message or error details

### competition_list_files

List files available in a competition.

```
competition_list_files(competition)
```

**Parameters:**
- `competition`: Competition URL suffix (e.g., 'titanic')

**Returns:** JSON string with file details

### competition_submissions

List your submissions for a competition.

```
competition_submissions(competition)
```

**Parameters:**
- `competition`: Competition URL suffix (e.g., 'titanic')

**Returns:** JSON string with submission details

### competition_leaderboard

View the competition leaderboard.

```
competition_leaderboard(competition)
```

**Parameters:**
- `competition`: Competition URL suffix (e.g., 'titanic')

**Returns:** JSON string with leaderboard details

### competition_submit

Submit to a competition.

```
competition_submit(competition, file_path, message)
```

**Parameters:**
- `competition`: Competition URL suffix (e.g., 'titanic')
- `file_path`: Path to the submission file
- `message`: Submission description

**Returns:** Success message or error details

## Examples

Here are some examples of how to use the competition tools with Claude:

```
# List all active competitions
competitions_list()

# Get details about the Titanic competition
competition_details("titanic")

# Download all files from the Titanic competition
competition_download_files("titanic", "/path/to/download")

# List files in the Titanic competition
competition_list_files("titanic")

# Check the Titanic leaderboard
competition_leaderboard("titanic")

# Submit to the Titanic competition
competition_submit("titanic", "/path/to/submission.csv", "My first submission")
```
