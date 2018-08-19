# Deleting files
Remove-Item .\file2.txt

git status

# Stage this deletion in repo
git add --update

git status

# Create a new file as part of this commit too...
Write-Output "Text for file3" > .\file3.txt

git status

git add .\file3.txt

git status

# Rename file1.txt
Move-Item .\file1.txt .\new_file_name.txt

git status

git add --all

git status

git commit --message "Reorganised the feature"

git status