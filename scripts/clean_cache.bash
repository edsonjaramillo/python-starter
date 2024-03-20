#!/bin/bash

# Find all directories named __pycache__ or .pytest_cache in the current directory and its subdirectories
cache_directories=$(find . -type d \( -name "__pycache__" -o -name ".pytest_cache" \))

# Check if any __pycache__ directories were found
if [ -z "$cache_directories" ]
then
    # If no __pycache__ directories were found, print a message and exit
    printf "No cache files to delete.\n"
else
    # Count the number of files in the __pycache__ directories
    file_count=$(printf "%s" "$cache_directories" | xargs -I {} find {} -type f | wc -l)

    # Delete the __pycache__ directories
    printf "%s" "$cache_directories" | xargs rm -rf

    # Print a message indicating how many cache files were deleted
    printf "Deleted %d cache files.\n" "$file_count"
fi