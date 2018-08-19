## Cleaning up files in a working copy

# Bunch of temp files kicking around
Write-Output $null > .\temp1.txt
Write-Output $null > .\temp2.txt

git status

# Use git clean to clean up WC, although doesn't work without parameters
git clean

# --dry-run shows what would happen
git clean --dry-run

# --force forces it to run
git clean --force

git status