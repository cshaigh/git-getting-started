# Undoing changes in the working copy

# Do something accidental...
Write-Output $null > .\readme.md

git status

# Revert to previous by using git checkout...
git checkout .\readme.md

# git status now shows nothing to commit...
git status

# readme.md is now as it was...
Get-Content .\readme.md

# do some buggering up...
Write-Output $null > .\readme.md
Remove-Item .\new_file_name.txt

git status

# Oops!  Time to do a hard reset...
git reset --hard

# All is now back to how it was...
git status