# show one-line git log as a graph
git log --graph --oneline

# show one-line log as a graph with decorations
git log --graph --oneline --all --decorate

# create a "log graph all" alias in global git config
git config --global alias.graphlog "log --graph --oneline --all --decorate"

# can now use the graphlog alias
git graphlog