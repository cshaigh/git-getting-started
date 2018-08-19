# Create 2 text files
Write-Output $null >> file1.txt
Write-Output $null >> file2.txt

# The following command only adds updated files 
# (changed files already known by Git)...
git add --update

# ...so no changes are noted: -
git status

# Could add explicitly, e.g. git add file1.txt file2.txt
# or -A: -
git add --all

# Be careful not to add files accidentally...
git status

git commit --message "Added cool new feature"

# Diff last commit
git diff HEAD~1

# Diff shows no content changes cos files are empty: -
Get-Content .\file1.txt

# Update file1.txt
Write-Output "Adding some code here" >> .\file1.txt

# Update readme.md
Write-Output "Updating README with new information" >> .\readme.md

git status

# Add only changes to readme.md to repo
git add .\readme.md

git status

# Commit only changes to readme.me...
git commit --message "Added new information to README"

# Now add and commit file1.txt changes
git add .\file1.txt

git commit --message "Fixed bug#1234"