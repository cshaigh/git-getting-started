<#

The Four Areas

Stash   Working Area    Index   Repository

Questions: -

How does this command move information across the Four Areas?
How does this command change the Repository?

Working Area
------------

Working Copy on local disk
Not always safe until committed into repository

Repository
----------

Committed changes
Collection of immutable objects: commits, blobs and trees
Objects can be created and deleted, but not changed
Branches: entry point to multiple commits
HEAD: special pointer usually pointing to the current branch but always pointing to a specific commit.

Index
-----

Something which stands between working area and repository
AKA the staging area
Stored in .\.git\index

#>

# get git status
git status
<#

    On branch master
    nothing to commit, working tree clean

#>

# ^^ this is "clean status", i.e. Working Area == (current commit of the) Repository

# see difference between working copy and index (currently displays nothing cos we are in clean status)
git diff

# see difference between index and repository (currently displays nothing cos we are in clean status)
git diff --cached

