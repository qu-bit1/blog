#!/bin/bash

echo ">>> Committing changes to source repository..."
# Navigate to the blog directory
cd ~/alles/blog/blog/

# Stage and commit changes in the main repository
git add .
read -p "Enter commit message: " commit_message
git commit -m "$commit_message"
git push origin main

echo ">>> Preparing submodule for deployment..."
# Navigate to the 'public' directory and switch to the main branch
cd public
git checkout main
git pull origin main # Ensure we have the latest changes
cd ..

echo ">>> Building site with Hugo..."
hugo

echo ">>> Deploying to GitHub Pages..."
# Navigate back into the 'public' directory
cd public

# Stage and commit changes in the 'public' repository
git add .
# Commit with a clear message
git commit -m "Build site: $commit_message"
git push origin main

echo ">>> Deployment complete!"
cd ..