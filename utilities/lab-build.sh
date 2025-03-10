#!/usr/bin/env bash

echo "Starting build process..."

# Remove old site files
echo "Removing old site files..."
rm -rf ./www/*
echo "Old site files removed."

# Build new site
echo "Building new site..."
npx antora --fetch default-site.yml --stacktrace

# Completion message
echo "Build process complete. Check the ./www folder for the generated site."
echo "To view the site locally, run: utilities/lab-action.sh serve"


