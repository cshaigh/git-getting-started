# GIT IS A STUPID CONTENT TRACKER

#region Setup Content
New-Item -ItemType Directory .\cookbook
Set-Location .\cookbook
Set-Content -Path .\menu.txt -Value "Apple Pie"
New-Item -ItemType Directory .\recipes
Set-Location .\recipes
Set-Content -Path .\README.txt -Value "Put your recipes in this directory, one recipe per file."
Set-Content -Path .\apple_pie.txt -Value "Apple Pie"
#endregion

#region List current cookbook
Set-Location ..
Get-ChildItem .
Get-Content .\menu.txt
Get-ChildItem .\recipes
Get-Content .\recipes\README.txt
Get-Content .\recipes\apple_pie.txt
#endregion

# initialise repo
git init

# check repo status
git status

# files must be staged before they can be checked in
git add .\menu.txt
git add .\recipes

# files are now staged
git status

# commit
git commit --message "First commit!"

# staging area now clean
git status

# get log and note commit ID (e79f3176a353eddc137eae4ca3431e03918baf42)
git log

# open objects folder.  First commit is stored under e7\9f3176a353eddc137eae4ca3431e03918baf42
explorer.exe .\.git\objects

# de-hash this object
git cat-file -p e79f3176a353eddc137eae4ca3431e03918baf42

# result
<#
    tree be4d5bfce489a2591e7fed5c672f9e52cd695a43
    author Chris Haigh <cshaigh1981@gmail.com> 1535793060 +0100
    committer Chris Haigh <cshaigh1981@gmail.com> 1535793060 +0100
#>

# tree is stored under be\4d5bfce489a2591e7fed5c672f9e52cd695a43
git cat-file -p be4d5bfce489a2591e7fed5c672f9e52cd695a43

# result
<#

    100644 blob 23991897e13e47ed0adb91a0082c31c82fe0cbe5    menu.txt
    040000 tree 3ee76fde69b730530f1682f1f51789e89cf30500    recipes

#>

# see the contents of the menu.txt blob (Apple Pie)
git cat-file -p 23991897e13e47ed0adb91a0082c31c82fe0cbe5

# see contents of recipes tree
git cat-file -p 3ee76fde69b730530f1682f1f51789e89cf30500

<# Result: -

    100644 blob 361af858632ee7d8d8f9c4022ccaf61fc8d4799c    README.txt
    100644 blob 23991897e13e47ed0adb91a0082c31c82fe0cbe5    apple_pie.txt

#>

# menu.txt and apple_pie.txt have the exact same has because their content is identical

# get contents of README.txt (Put your recipes in this directory, one recipe per file.)
git cat-file -p 361af858632ee7d8d8f9c4022ccaf61fc8d4799c