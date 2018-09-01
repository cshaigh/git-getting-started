# Create annotated tag
git tag mytag --annotate --message "I love cheesecake"

# see tags (mytag)
git tag --list

# peek mytag
git cat-file -p mytag
<#

    object 3928beef6aa73e0734b965faa2ed82efc0c51455
    type commit
    tag mytag
    tagger Chris Haigh <cshaigh1981@gmail.com> 1535795205 +0100

#>

# peek tag's object - is just a pointer to most recent commit
git cat-file -p 3928beef6aa73e0734b965faa2ed82efc0c51455
<# 

    tree 6ee0cdeefafa85f8baea117d3181e873e634093d
    parent e79f3176a353eddc137eae4ca3431e03918baf42
    author Chris Haigh <cshaigh1981@gmail.com> 1535794360 +0100
    committer Chris Haigh <cshaigh1981@gmail.com> 1535794360 +0100

    Add cake

#>