---
layout: default
title: Kernels API
---

# Kernels API

Kaggle-MCP provides tools to search, download, and manage Kaggle kernels/notebooks directly through Claude.

## Available Tools

### kernels_list

List available Kaggle kernels with extensive filtering options.

```
kernels_list(search="", user="", language="all", kernel_type="all", output_type="all", sort_by="hotness", page=1, page_size=20)
```

**Parameters:**
- `search`: Term(s) to search for
- `user`: Display kernels by a specific user
- `language`: Display kernels in a specific language (all, python, r, sqlite, julia)
- `kernel_type`: Display kernels of a specific type (all, script, notebook)
- `output_type`: Display kernels with a specific output type (all, visualization, data)
- `sort_by`: Sort kernels by (hotness, votes, updated, created)
- `page`: Page number for results paging
- `page_size`: Number of items per page

**Returns:** JSON string with kernel details

### kernel_list_files

List files in a specific kernel.

```
kernel_list_files(kernel)
```

**Parameters:**
- `kernel`: Kernel identifier in format `<owner>/<kernel-name>`

**Returns:** JSON string with file details

### kernel_output

Download the output of a Kaggle kernel.

```
kernel_output(kernel, path="")
```

**Parameters:**
- `kernel`: Kernel identifier in format `<owner>/<kernel-name>`
- `path`: Folder where output will be downloaded (defaults to a temp directory)

**Returns:** Success message or error details

### kernel_pull

Pull/download code from a kernel.

```
kernel_pull(kernel, path="", metadata=False)
```

**Parameters:**
- `kernel`: Kernel identifier in format `<owner>/<kernel-name>`
- `path`: Folder where kernel will be downloaded (defaults to a temp directory)
- `metadata`: Whether to generate kernel metadata file

**Returns:** Success message or error details

### kernel_status

Get the status of a kernel.

```
kernel_status(kernel)
```

**Parameters:**
- `kernel`: Kernel identifier in format `<owner>/<kernel-name>`

**Returns:** JSON string with kernel status details

### kernel_initialize_metadata

Initialize kernel metadata file for later upload.

```
kernel_initialize_metadata(path=".", kernel_type="notebook", language="python")
```

**Parameters:**
- `path`: Directory where metadata file will be created
- `kernel_type`: Type of kernel (notebook or script)
- `language`: Language of kernel (python, r, or rmarkdown)

**Returns:** Success message or error details

### kernel_push

Push a new version of a kernel or create a new kernel.

```
kernel_push(folder_path)
```

**Parameters:**
- `folder_path`: Path to the folder containing kernel files and metadata

**Returns:** Success message or error details

## Examples

Here are some examples of how to use the kernel tools with Claude:

```
# Search for Python notebooks about machine learning
kernels_list(search="machine learning", language="python", kernel_type="notebook")

# Download a specific kernel
kernel_pull("username/kernel-name", "/path/to/download")

# Check the status of a kernel
kernel_status("username/kernel-name")

# Create a new kernel
kernel_initialize_metadata("/path/to/project", kernel_type="notebook", language="python")
kernel_push("/path/to/project")
```
