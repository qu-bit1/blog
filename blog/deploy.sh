#!/bin/bash

# Navigate to the blog directory
cd ~/Code/jeevan-ke-dukh/blog/blog/

# Stage and commit changes in the main repository
git add .
read -p "Enter commit message: " commit_message
git commit -m "$commit_message"
git pull origin main --rebase  # Add this line to pull changes first
git push origin main

# Build the Hugo site with the specified theme
hugo -t terminal

# Navigate to the 'public' directory
cd public

# Stage and commit changes in the 'public' repository
git add .
git commit -m "$commit_message"
git pull origin main --rebase  # Add this line to pull changes first
git push origin main

# Navigate back to the original directory
cd ..
