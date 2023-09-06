#!/bin/sh

# Define the directory structure
APP_DIRS="/Ruuter/private/v2 /Ruuter/public/v2 /Ruuter/private/v1 /Ruuter/public/v1 /Resql /DataMapper /Liquibase /OpenSearch /OpenSearch2"

for dir in $APP_DIRS; do
    if [ -d "$dir" ]; then
        echo "Copying contents of $dir..."
        cp -r "$dir" /"$dir"
    else
        echo "$dir does not exist, skipping copy."
    fi
done

# Set the main command to run your application
exec python run.py
