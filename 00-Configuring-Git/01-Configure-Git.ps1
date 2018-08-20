# System-level configuration (stored in %PROGRAMFILES%\Git\etc\.gitconfig)

# List contents of system-level config file
git config --system --list

# User-level configuration (stored in %USERPROFILE%\.gitconfig)
git config --global --list

# set user's email address
git config --global user.email "cshaigh1981@gmail.com"
git config --global user.name "Chris Haigh"

# set user's code editor
git config --global core.editor nano

# enable cmd 'fuzzy matching'
git config --global help.autocorrect 1

# colourise output unless in scripts
git config --global color.ui auto

# undo a setting
git config --global --unset color.ui

# Repo-level configuration (stored in .git\config in each repo)
git config

# List contents of repo-level config file
git config --list