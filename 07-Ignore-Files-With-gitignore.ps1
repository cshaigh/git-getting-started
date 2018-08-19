## For example, creating log files and having git ignore them with .gitignore
New-Item -ItemType Directory .\logs

Write-Output $null > .\logs\log.txt

# Don't want to commit log files to repo...
git status

# Build up a .gitignore file
Write-Output "logs/*.txt" > .\.gitignore
Write-Output "logs/*.log" >> .\.gitignore
Write-Output "logs/**" >> .\.gitignore

Get-Content .\.gitignore

# Now, git status only shows .gitignore file has changed and is ignoring the logs folder...
git status

# Add and commit .gitignore file to repo
git add .\.gitignore
git commit --message "Added .gitignore"

git status