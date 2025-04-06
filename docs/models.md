---
layout: default
title: Models API
---

# Models API

Kaggle-MCP provides tools to search, download, create, and manage Kaggle models directly through Claude.

## Available Tools

### models_list

List available Kaggle models with filtering options.

```
models_list(search="", sort_by="hotness", owner="", page_size=20, page_token="")
```

**Parameters:**
- `search`: Term(s) to search for
- `sort_by`: Sort models by (hotness, votes, updated, active)
- `owner`: Display models by a specific user or organization
- `page_size`: Number of items per page
- `page_token`: Page token for pagination

**Returns:** JSON string with model details

### model_get

Get details of a specific model.

```
model_get(model)
```

**Parameters:**
- `model`: Model identifier in format `<owner>/<model-name>`

**Returns:** JSON string with model details

### model_initialize_metadata

Initialize metadata file for model creation.

```
model_initialize_metadata(path=".")
```

**Parameters:**
- `path`: Directory where metadata file will be created

**Returns:** Success message or error details

### model_create_new

Create a new model on Kaggle.

```
model_create_new(folder_path)
```

**Parameters:**
- `folder_path`: Path to the folder containing model files and metadata

**Returns:** Success message or error details

### model_update

Update an existing model.

```
model_update(model, folder_path)
```

**Parameters:**
- `model`: Model identifier in format `<owner>/<model-name>`
- `folder_path`: Path to the folder containing model metadata

**Returns:** Success message or error details

### model_delete

Delete a model.

```
model_delete(model)
```

**Parameters:**
- `model`: Model identifier in format `<owner>/<model-name>`

**Returns:** Success message or error details

## Model Instances

Model instances represent specific implementations of a model.

### model_instance_get

Get details of a specific model instance.

```
model_instance_get(model_instance)
```

**Parameters:**
- `model_instance`: Model instance identifier in format `<owner>/<model-name>/<framework>/<instance-slug>`

**Returns:** JSON string with model instance details

### model_instance_initialize_metadata

Initialize metadata file for model instance creation.

```
model_instance_initialize_metadata(path=".")
```

**Parameters:**
- `path`: Directory where metadata file will be created

**Returns:** Success message or error details

### model_instance_create

Create a new model instance.

```
model_instance_create(model, folder_path)
```

**Parameters:**
- `model`: Model identifier in format `<owner>/<model-name>`
- `folder_path`: Path to the folder containing model instance metadata

**Returns:** Success message or error details

### model_instance_update

Update an existing model instance.

```
model_instance_update(model_instance, folder_path)
```

**Parameters:**
- `model_instance`: Model instance identifier in format `<owner>/<model-name>/<framework>/<instance-slug>`
- `folder_path`: Path to the folder containing model instance metadata

**Returns:** Success message or error details

### model_instance_delete

Delete a model instance.

```
model_instance_delete(model_instance)
```

**Parameters:**
- `model_instance`: Model instance identifier in format `<owner>/<model-name>/<framework>/<instance-slug>`

**Returns:** Success message or error details

### model_instance_list_files

List files in a model instance for the current version.

```
model_instance_list_files(model_instance)
```

**Parameters:**
- `model_instance`: Model instance identifier in format `<owner>/<model-name>/<framework>/<instance-slug>`

**Returns:** JSON string with file details

## Model Instance Versions

You can manage different versions of a model instance.

### model_instance_version_create

Create a new model instance version.

```
model_instance_version_create(model_instance, folder_path, version_notes)
```

**Parameters:**
- `model_instance`: Model instance identifier in format `<owner>/<model-name>/<framework>/<instance-slug>`
- `folder_path`: Path to the folder containing files to upload
- `version_notes`: Notes describing the new version

**Returns:** Success message or error details

### model_instance_version_download

Download model instance version files.

```
model_instance_version_download(model_instance_version, path="")
```

**Parameters:**
- `model_instance_version`: Model instance version identifier in format `<owner>/<model-name>/<framework>/<instance-slug>/<version-number>`
- `path`: Folder where file(s) will be downloaded (defaults to a temp directory)

**Returns:** Success message or error details

### model_instance_version_delete

Delete a model instance version.

```
model_instance_version_delete(model_instance_version)
```

**Parameters:**
- `model_instance_version`: Model instance version identifier in format `<owner>/<model-name>/<framework>/<instance-slug>/<version-number>`

**Returns:** Success message or error details

### model_instance_version_list_files

List files in a specific model instance version.

```
model_instance_version_list_files(model_instance_version)
```

**Parameters:**
- `model_instance_version`: Model instance version identifier in format `<owner>/<model-name>/<framework>/<instance-slug>/<version-number>`

**Returns:** JSON string with file details

## Examples

Here are some examples of how to use the model tools with Claude:

```
# Search for machine learning models
models_list(search="machine learning")

# Get details about a specific model
model_get("username/model-name")

# Create a new model instance
model_instance_initialize_metadata("/path/to/project")
model_instance_create("username/model-name", "/path/to/project")

# Download a specific model instance version
model_instance_version_download("username/model-name/framework/instance-slug/1", "/path/to/download")
```
