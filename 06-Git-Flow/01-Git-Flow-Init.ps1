# Initialise a git flow repository
git flow init
<#

    Initialized empty Git repository in F:/dev/gitflowdemo/.git/
    No branches exist yet. Base branches must be created now.
    Branch name for production releases: [master]
    Branch name for "next release" development: [develop]

    How to name your supporting branch prefixes?
    Feature branches? [feature/]
    Bugfix branches? [bugfix/]
    Release branches? [release/]
    Hotfix branches? [hotfix/]
    Support branches? [support/]
    Version tag prefix? []
    Hooks and filters directory? [F:/dev/gitflowdemo/.git/hooks]

#>

# 2 branches - develop and master - have been created and we have been automatically switched to develop

git branch
<#

    * develop
    master

#>

# The develop branch is the default branch where most of the work will happen.
# The master branch keeps track of production-ready code.

