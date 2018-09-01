# Annotated tags
git log --oneline

# make an unsigned, annotated tag called dinner
git tag --annotate dinner

# make a lightweights tag called dinner
git tag dinner

git tag --list
<#

dinner
mytag

#>

# branches are stored in .\.git\refs\heads
# tags are stored in .\.git\refs\tags
Get-ChildItem .\.git\refs\tags
<#

        Directory: F:\dev\cookbook\.git\refs\tags


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    -a----       01/09/2018     17:24             41 dinner
    -a----       01/09/2018     10:46             41 mytag

#>
Get-Content .\.git\refs\tags\dinner
# 022ba96e1ecd4ef9f134a11395b04387e54850f0

git cat-file -p 022ba96e1ecd4ef9f134a11395b04387e54850f0
<#

    tree 9ee4fd48e6bf5a0f8a4bf7067977d38ac3ed9b33
    parent f6ac104bbd7182756d6464ebedd477785987987e
    author Chris Haigh <cshaigh1981@gmail.com> 1535817414 +0100
    committer Chris Haigh <cshaigh1981@gmail.com> 1535817414 +0100

#>

# A TAG IS LIKE A BRANCH THAT DOESN'T MOVE