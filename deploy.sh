
#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

git add .

# Commit changes.
tag="v10.0.1"
msg="rebuilding site $(date)"
if [ -n "$1" ]; then
	tag="$1"
fi
if [ -n "$2" ]; then
	msg="$2"
fi
git tag -a "$tag" -m "$msg"

# Push source and build repos.
git remote -v &> /dev/null
if [ $? -eq 0 ]
then 
git push -f origin master
else 
git remote add origin git@github.com:suainam/jsd.git
git push -f origin master
fi