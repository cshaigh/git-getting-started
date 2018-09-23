# git also keeps a record of references.

# change branches a couple of times
git checkout spaghetti
git checkout master

# see the reference log for HEAD
git reflog HEAD
<#

    08b57b7 (HEAD -> master) HEAD@{0}: checkout: moving from spaghetti to master
    022ba96 (tag: dinner, spaghetti) HEAD@{1}: checkout: moving from 19a9e91717a188102e386a9aff2c80fa929e2050 to spaghetti
    19a9e91 HEAD@{2}: rebase -i: fast-forward
    3928bee (tag: mytag) HEAD@{3}: rebase -i (start): checkout e79f317
    08b57b7 (HEAD -> master) HEAD@{4}: rebase -i (finish): returning to refs/heads/master
    08b57b7 (HEAD -> master) HEAD@{5}: rebase -i (pick): Add Caesar Salar to menu
    e146fdd HEAD@{6}: rebase -i (pick): Make README all uppercase
    e7231ad HEAD@{7}: rebase -i (pick): Add guacamole
    91a7eb3 HEAD@{8}: rebase -i (reword): Fix bad renaming
    a307747 HEAD@{9}: rebase -i: fast-forward
    062fc4d HEAD@{10}: rebase -i (start): checkout e79f317
    e412862 HEAD@{11}: rebase -i (finish): returning to refs/heads/master
    e412862 HEAD@{12}: rebase -i (pick): Add Caesar Salar to menu
    b69c824 HEAD@{13}: rebase -i (pick): Make README all uppercase
    4f48fef HEAD@{14}: rebase -i (squash): Add guacamole
    9a4ece7 HEAD@{15}: rebase -i (squash): # This is a combination of 2 commits.
    3f3a1dc HEAD@{16}: rebase -i (pick): Add guacamole
    a307747 HEAD@{17}: rebase -i (reword): Well, I changed my mind about that renaming
    062fc4d HEAD@{18}: rebase -i (pick): Use Markdown for the menu
    a54546c HEAD@{19}: rebase -i (squash): Add Tikka Masala to menu
    9bf4680 HEAD@{20}: rebase -i (pick): Add Tikka Masala to menu
    e50ed35 HEAD@{21}: rebase -i (squash): Add spaghetti alla carbonara
    dac940e HEAD@{22}: rebase -i (pick): Add spaghetti alla carbonara

#>

# can use reflog to view / recover old objects no longer garbage collected
git show a307747
git show "HEAD@{17}"

# can recover to a new branch
git branch recovered
git checkout recovered
git merge "HEAD@{17}"
git status

# view reflog of other references
git reflog refs/heads/master