---
layout: default
title: Examples
---

# Examples

This page provides real-world examples of using Kaggle-MCP with Claude, demonstrating how to interact with Kaggle through natural language conversations.

## Authentication

```
User: I'd like to use Kaggle for my data science work. Can you help me set up my credentials?

Claude: I'd be happy to help you set up your Kaggle credentials. First, you'll need to get your API key from Kaggle:

1. Go to your Kaggle account settings at https://www.kaggle.com/settings/account
2. Scroll down to the API section
3. Click "Create New API Token" to download a kaggle.json file

Once you have that file, you can authenticate using the authenticate() tool by providing your username and key from the downloaded file:

authenticate("your_username", "your_api_key")

Alternatively, you can move the kaggle.json file to ~/.kaggle/kaggle.json and set the correct permissions with:
chmod 600 ~/.kaggle/kaggle.json

Let me know when you have your API credentials, and I'll help you authenticate.
```

## Exploring Competitions

```
User: Show me the top Kaggle competitions happening right now.

Claude: Let me list the currently active Kaggle competitions for you:

competitions_list(sort_by="prize", category="featured")

Here are the top competitions sorted by prize amount. Is there any specific competition you're interested in learning more about?

User: Tell me more about the Titanic competition.

Claude: I'll get the details of the Titanic competition for you:

competition_details("titanic")

This is Kaggle's legendary Titanic Machine Learning competition, where the goal is to predict which passengers survived the Titanic shipwreck. It's a great beginner-friendly competition.

Would you like me to:
1. Show you the competition files
2. Download the data files
3. Show you the current leaderboard
4. Something else?
```

## Working with Datasets

```
User: Can you help me find datasets related to climate change?

Claude: I'd be happy to help you find climate change datasets on Kaggle:

datasets_list(search="climate change", sort_by="votes", size="all")

These are the top-voted datasets related to climate change. Would you like to:
1. Get more details about any of these datasets
2. Narrow the search (e.g., by file type, license, etc.)
3. Download one of these datasets
4. Something else?

User: The global temperature dataset looks interesting. Can you download it for me?

Claude: I'll download the global temperature dataset for you:

dataset_download_files("berkeleyearth/climate-change-earth-surface-temperature-data", path="/path/to/download")

The dataset has been downloaded to the specified path. Would you like me to:
1. List the files in the dataset
2. Help you analyze the dataset
3. Look for notebooks that use this dataset
4. Something else?
```

## Exploring and Using Kernels

```
User: Find me some good notebooks for sentiment analysis.

Claude: Let me search for popular sentiment analysis notebooks on Kaggle:

kernels_list(search="sentiment analysis", sort_by="votes", kernel_type="notebook", language="python")

These are the top-voted Python notebooks for sentiment analysis. Would you like to:
1. Get more details about any specific notebook
2. Download one of these notebooks
3. Refine the search
4. Something else?

User: The first one looks useful. Can you download it?

Claude: I'll download the notebook for you:

kernel_pull("username/sentiment-analysis-notebook", path="/path/to/download")

The notebook has been downloaded. Would you like me to:
1. List the files in the notebook
2. Explain the approach used in the notebook
3. Help you adapt this notebook for your own dataset
4. Something else?
```

## Working with Models

```
User: Find me pre-trained models for image classification.

Claude: Let me search for popular image classification models on Kaggle:

models_list(search="image classification", sort_by="votes")

These are the top-voted image classification models. Would you like to:
1. Get more details about any specific model
2. Download a model
3. Refine the search
4. Something else?

User: Can you show me the details of the first model?

Claude: I'll get the details of the image classification model you're interested in:

model_get("username/image-classification-model")

Here are the full details of the model, including its description, framework, and usage information. Would you like to:
1. Download this model
2. See other versions of this model
3. Look for notebooks that use this model
4. Something else?
```

## Data Analysis Workflow

```
User: I want to participate in the Titanic competition. Help me get started.

Claude: I'll help you get started with the Titanic competition. Let's break this down into steps:

1. First, let's get the competition details:
   competition_details("titanic")

2. Now, let's download the competition files:
   competition_download_files("titanic", path="/path/to/titanic")

3. Let's list the files to see what we're working with:
   competition_list_files("titanic")

Great! Now that we have the data, we can start analyzing it. We typically have train.csv and test.csv files.

Would you like me to:
1. Help you explore the data
2. Show you some strategies for feature engineering
3. Help build a simple model
4. Find successful notebooks for inspiration
5. Something else?
```

## Advanced Use Cases

```
User: I want to create and upload a new dataset of weather data.

Claude: I'll help you create and upload a new weather dataset to Kaggle. Here's the process:

1. First, let's initialize the dataset metadata:
   dataset_initialize_metadata("/path/to/weather_data")

2. Now, let's prepare the metadata with a proper description and license:
   dataset_update_metadata("your-username/weather-dataset", '''
   {
     "title": "Weather Dataset 2023",
     "subtitle": "Comprehensive weather data from multiple sources",
     "description": "This dataset contains daily weather measurements including temperature, precipitation, and wind speed from various global stations.",
     "licenses": [{"name": "CC0-1.0"}],
     "keywords": ["weather", "climate", "temperature", "precipitation"]
   }
   ''')

3. Finally, let's create the dataset:
   dataset_create_new("Weather Dataset 2023", "/path/to/weather_data", license_name="CC0-1.0", description="Comprehensive weather data from multiple sources", is_private=False)

The dataset has been created! Would you like to:
1. Update any metadata
2. Check the status of the upload
3. Create a kernel to analyze this dataset
4. Something else?
```

These examples show the flexibility and power of using Kaggle-MCP with Claude. You can have natural conversations while leveraging the full capabilities of the Kaggle platform.
