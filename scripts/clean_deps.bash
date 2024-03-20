#!/bin/bash

# Define the virtual environment directory
venv_dir=".venv/lib"

# Check if the virtual environment directory exists
if [ ! -d "$venv_dir" ]; then
    echo "Error: Virtual environment directory $venv_dir does not exist."
    exit 1
fi

# Get the python version
python_version=$(ls "$venv_dir")

# Check if the python version directory exists
if [ -z "$python_version" ]; then
    echo "Error: No Python version found in $venv_dir."
    exit 1
fi

# Define the site-packages directory
site_packages_dir="$venv_dir/$python_version/site-packages"

# Check if the site-packages directory exists
if [ ! -d "$site_packages_dir" ]; then
    echo "Error: site-packages directory $site_packages_dir does not exist."
    exit 1
fi

# Use find command to delete dependencies that don't start with 'pip'
find "$site_packages_dir" -mindepth 1 -maxdepth 1 -type d ! -name 'pip*' -exec rm -rf {} \;

# Check if the find command was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to delete dependencies."
    exit 1
fi

echo "Successfully deleted dependencies."