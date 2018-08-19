# Show git log as graph
git log --oneline --graph

# Show a short log of commits to this repo
# Man page: summarises git log output in a format suitable for inclusion in release announcements.
#           Each commit will be grouped by author and title.
git shortlog

# Short summary of authors in descending order of commits (shorthand params: -sne)
git shortlog --numbered --summary --email