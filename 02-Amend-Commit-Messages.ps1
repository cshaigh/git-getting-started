Get-ChildItem

Get-Content .\file1.txt

Write-Output "Another Fix" >> .\file1.txt

git commit --all --message "Added another fix"

# Fix a typo in file1.txt
notepad .\file1.txt

# Verify typo fix...
Get-Content .\file1.txt

# Amend previous commit...
git commit --amend --message "Added another fix for real"

# Check the log
git log --oneline