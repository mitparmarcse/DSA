#!/bin/bash

# Navigate to the DSA folder
cd /your_path || exit

# Add all changes
git add .

# Check for changes before committing
if git diff-index --quiet HEAD --; then
    # No changes to commit
    echo "No changes to sync on $(date)"
else
    # Commit changes with a timestamp
    git commit -m "Auto-sync: $(date +'%Y-%m-%d %H:%M:%S')"
    
    # Push changes to GitHub
    if git push origin main; then
        echo "Sync successful on $(date)"
    else
        echo "Sync failed on $(date)"
    fi
fi
