#!/bin/bash

# Load the environment variables from the .env file
if [ -f .env ]; then
  source .env
else
  echo "Error: .env file not found"
  exit 1
fi

# Check if the GA_ID variable is provided
if [ -z "$GA_ID" ]; then
  echo "Error: GA_ID not found in .env file"
  exit 1
fi

# Define the paths
HTML_FILE="index.html"
BUILD_FOLDER="build"

# Create the build folder if it doesn't exist
mkdir -p "$BUILD_FOLDER"

# Copy the original HTML file to the build folder
cp "$HTML_FILE" "$BUILD_FOLDER"

# Generate the new HTML file with the updated Google Analytics ID
NEW_HTML_FILE="$BUILD_FOLDER/$HTML_FILE"
sed "s/GA_ID/$GA_ID/g" "$HTML_FILE" > "$NEW_HTML_FILE"

rm -rf "$BUILD_FOLDER/img"
cp -r img "$BUILD_FOLDER"

echo "Google Analytics ID updated to $GA_ID in $NEW_HTML_FILE"
