---
layout: default
title: Datasets API
---

# Datasets API

Kaggle-MCP provides tools to search, download, create, and manage Kaggle datasets directly through Claude.

## Available Tools

### datasets_list

List available Kaggle datasets with extensive filtering options.

```
datasets_list(search="", user="", license_name="all", file_type="all", tags="", sort_by="hotness", size="all", page=1)
```

**Parameters:**
- `search`: Term(s) to search for
- `user`: Display datasets by a specific user or organization
- `license_name`: Display datasets with a specific license (all, cc, gpl, odb, other)
- `file_type`: Display datasets of a specific file type (all, csv, sqlite, json, bigQuery)
- `tags`: Tag IDs to filter by (comma-separated)
- `sort_by`: Sort datasets by (hotness, votes, updated, active)
- `size`: Filter by dataset size (all, small, medium, large)
- `page`: Page number for results paging

**Returns:** JSON string with dataset details

### dataset_list_files

List files in a specific dataset.

```
dataset_list_files(dataset)
```

**Parameters:**
- `dataset`: Dataset identifier in format `<owner>/<dataset-name>`

**Returns:** JSON string with file details

### dataset_download_files

Download dataset files to a specified location.

```
dataset_download_files(dataset, path="", file_name="", force=False)
```

**Parameters:**
- `dataset`: Dataset identifier in format `<owner>/<dataset-name>`
- `path`: Folder where file(s) will be downloaded (defaults to a temp directory)
- `file_name`: File name, all files downloaded if not provided
- `force`: Force download even if files exist

**Returns:** Success message or error details

### dataset_metadata

Get detailed metadata for a dataset.

```
dataset_metadata(dataset)
```

**Parameters:**
- `dataset`: Dataset identifier in format `<owner>/<dataset-name>`

**Returns:** JSON string with dataset metadata

### dataset_create_new

Create a new dataset on Kaggle.

```
dataset_create_new(title, files_dir, license_name="unknown", description="", is_private=True)
```

**Parameters:**
- `title`: Title of the dataset
- `files_dir`: Directory containing files to upload
- `license_name`: License for the dataset (e.g., 'CC0-1.0', 'CC-BY-SA-4.0')
- `description`: Dataset description
- `is_private`: Whether the dataset should be private

**Returns:** Success message or error details

### dataset_create_version

Create a new version of an existing dataset.

```
dataset_create_version(dataset, files_dir, version_notes, convert_to_csv=True, delete_old_versions=False)
```

**Parameters:**
- `dataset`: Dataset identifier in format `<owner>/<dataset-name>`
- `files_dir`: Directory containing files to upload
- `version_notes`: Notes describing the new version
- `convert_to_csv`: Whether to convert tabular data to CSV
- `delete_old_versions`: Whether to delete all previous versions

**Returns:** Success message or error details

### dataset_status

Check the creation or update status of a dataset.

```
dataset_status(dataset)
```

**Parameters:**
- `dataset`: Dataset identifier in format `<owner>/<dataset-name>`

**Returns:** Status information as JSON string

### dataset_initialize_metadata

Initialize dataset metadata file for later upload.

```
dataset_initialize_metadata(path=".")
```

**Parameters:**
- `path`: Directory where metadata file will be created

**Returns:** Success message or error details

### dataset_update_metadata

Update metadata for an existing dataset.

```
dataset_update_metadata(dataset, metadata_dict)
```

**Parameters:**
- `dataset`: Dataset identifier in format `<owner>/<dataset-name>`
- `metadata_dict`: JSON string with metadata to update (title, subtitle, description, etc.)

**Returns:** Success message or error details

## Examples

Here are some examples of how to use the dataset tools with Claude:

```
# Search for datasets about machine learning
datasets_list(search="machine learning", sort_by="votes")

# List files in a specific dataset
dataset_list_files("username/dataset-name")

# Download a specific dataset
dataset_download_files("username/dataset-name", "/path/to/download")

# Create a new dataset
dataset_create_new("My Dataset", "/path/to/files", license_name="CC0-1.0", description="A sample dataset", is_private=True)

# Update an existing dataset
dataset_create_version("username/dataset-name", "/path/to/files", "Updated with new data for 2023")
```
