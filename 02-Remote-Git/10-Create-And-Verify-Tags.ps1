## Creating tags and tags with annotations

# Tag master branch as v1.0
git tag v1.0

# See list of tags
git tag

# Create a tag with a message (annotation)
git tag --annotate v1.0_with_message --message "This is v1.0."

git tag

## Generate a secret key

# Alias to gpg.exe
$gpgCmd = "C:\Program Files\Git\usr\bin\gpg.exe"
$keyFile = ".\gen-key.txt"

# Create array to hold key file script
$keyFileScript = @()

# Wipe out contents of gen-key.txt file
Write-Output $null > $keyFile

# Get a password
$response = Read-Host "What passphrase would you like to generate your key?" -AsSecureString
$passphrase = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($response))

$keyFileScript += "%echo Generating a key"
$keyFileScript += "Key-Type: RSA"
$keyFileScript += "Key-Length: 2048"
$keyFileScript += "Subkey-Type: RSA"
$keyFileScript += "Subkey-Length: 2048"
$keyFileScript += "Passphrase: $passphrase"
$keyFileScript += "Name-Real: Chris Haigh"
$keyFileScript += "Name-Comment: Head of DevOps"
$keyFileScript += "Name-Email: cshaigh1981@gmail.com"
$keyFileScript += "Expire-Date: 1y"

# Do a commit here, so that we can later print "done" :-)
$keyFileScript += "%commit"
$keyFileScript += "%echo done"

# Write $keyFileScript to $keyFile
$keyFileScript | Out-File -Encoding ascii $keyFile

# Generate key using keyFileScript
& $gpgCmd --batch --gen-key $keyFile

# List key
& $gpgCmd --list-key

# Set user key to have same key as pub
git config --global user.signingkey 92107CE4

# Verify
& $gpgCmd --list-key