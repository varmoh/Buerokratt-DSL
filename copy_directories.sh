#!/bin/sh

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
