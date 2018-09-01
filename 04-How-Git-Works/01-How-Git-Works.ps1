# Git is a persistent map

# create a sha1 hash of "Apple Pie"
Write-Output "Apple Pie" | git hash-object --stdin

# create a sha1 has of "Apple Pie" and write into the object database
Write-Output "Apple Pie" | git hash-object --stdin -w

# stored hash "157cb7be4778a9cfad23b6fb514e364522167053" as .\.git\objects\15\7cb7be4778a9cfad23b6fb514e364522167053

# Get type of object hash (blob)
git cat-file -t "157cb7be4778a9cfad23b6fb514e364522167053"

# Pretty-print object's content (Apple Pie)
git cat-file -p "157cb7be4778a9cfad23b6fb514e364522167053"