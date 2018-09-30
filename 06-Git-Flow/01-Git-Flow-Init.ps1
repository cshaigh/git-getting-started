# Initialise a git flow repository
git flow init --showcommands --defaults
<#

    git init
    Initialized empty Git repository in F:/dev/gitflow2/.git/
    Using default branch names.
    No branches exist yet. Base branches must be created now.
    Branch name for production releases: [master]
    git config gitflow.branch.master master
    Branch name for "next release" development: [develop]
    git config gitflow.branch.develop develop
    git symbolic-ref HEAD refs/heads/master
    git commit --allow-empty --quiet -m Initial commit
    git branch --no-track develop master
    git checkout -q develop

    How to name your supporting branch prefixes?
    Feature branches? [feature/]
    git config gitflow.prefix.feature feature/
    Bugfix branches? [bugfix/]
    git config gitflow.prefix.bugfix bugfix/
    Release branches? [release/]
    git config gitflow.prefix.release release/
    Hotfix branches? [hotfix/]
    git config gitflow.prefix.hotfix hotfix/
    Support branches? [support/]
    git config gitflow.prefix.support support/
    Version tag prefix? []
    git config gitflow.prefix.versiontag
    Hooks and filters directory? [F:/dev/gitflow2/.git/hooks]
    git config gitflow.path.hooks F:/dev/gitflow2/.git/hooks

#>

# 2 branches - develop and master - have been created and we have been automatically switched to develop

git branch
<#

    * develop
    master

#>

# The develop branch is the default branch where most of the work will happen.
# The master branch keeps track of production-ready code.

