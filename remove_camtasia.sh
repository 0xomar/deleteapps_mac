#!/bin/bash

# Step 1: Search for all files/folders related to Camtasia
echo "Searching for all files and folders related to 'Camtasia'..."
matches=$(sudo find / -iname "*camtasia*" 2>/dev/null)

# Step 2: Show results to user
if [[ -z "$matches" ]]; then
    echo "No files or folders found containing 'camtasia'."
    exit 0
fi

echo "The following files/folders were found:"
echo "$matches"
echo

# Step 3: Ask for confirmation using the actual terminal (guaranteed prompt)
echo -n "Do you want to DELETE all of these? (yes/no): " 
read confirm

# Step 4: If confirmed, delete each item
if [[ "$confirm" == "yes" ]]; then
    echo "$matches" | while IFS= read -r line; do
        echo "Deleting: $line"
        sudo rm -rf "$line"
    done
    echo "✅ Deletion complete."
else
    echo "❌ Deletion canceled."
fi
