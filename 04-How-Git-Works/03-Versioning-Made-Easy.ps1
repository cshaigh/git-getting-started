# Add cheesecake to menu.txt and commit
Add-Content -Path .\menu.txt -Value "Cheesecake"
git status
git add .\menu.txt
git status
git commit --message "Add cake"
git status

# Get log and peek inside second commit
git log

<# Result: -

    commit 3928beef6aa73e0734b965faa2ed82efc0c51455 (HEAD -> master)
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 10:32:40 2018 +0100

        Add cake

    commit e79f3176a353eddc137eae4ca3431e03918baf42
    Author: Chris Haigh <cshaigh1981@gmail.com>
    Date:   Sat Sep 1 10:11:00 2018 +0100

        First commit!

#>

git cat-file -p 3928beef6aa73e0734b965faa2ed82efc0c51455

<# 

    tree 6ee0cdeefafa85f8baea117d3181e873e634093d
    parent e79f3176a353eddc137eae4ca3431e03918baf42
    author Chris Haigh <cshaigh1981@gmail.com> 1535794360 +0100
    committer Chris Haigh <cshaigh1981@gmail.com> 1535794360 +0100

#>

# peek at commit's parent (NB first commit has no parent)
git cat-file -p e79f3176a353eddc137eae4ca3431e03918baf42

<#

    tree be4d5bfce489a2591e7fed5c672f9e52cd695a43
    author Chris Haigh <cshaigh1981@gmail.com> 1535793060 +0100
    committer Chris Haigh <cshaigh1981@gmail.com> 1535793060 +0100

#>

# cat new commit's tree
git cat-file -p 6ee0cdeefafa85f8baea117d3181e873e634093d
<#

    100644 blob f1fe985b46ca38f32d7bf4024a9218cb58be74f7    menu.txt
    040000 tree 3ee76fde69b730530f1682f1f51789e89cf30500    recipes

#>

# peek this commit's menu.txt blob
git cat-file -p f1fe985b46ca38f32d7bf4024a9218cb58be74f7
<#

    Apple Pie
    Cheesecake

#>

# count the number objects in the database (8 objects, 0 kilobytes)
git count-objects