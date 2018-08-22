## Creating tags and tags with annotations

# Tag master branch as v1.0
git tag "v1.0"

# See list of tags
git tag

# Create a tag with a message (annotation)
git tag --annotate "v1.0_with_message" --message "This is v1.0."

git tag

## Generate a secret key

# Alias to gpg.exe
$gpgCmd = "C:\Program Files\Git\usr\bin\gpg.exe"
$keyGenScriptFile = ".\gen-key.txt"
$keyFile = ".\"

# Get a passphrase
$response = Read-Host "What passphrase would you like to generate your key?" -AsSecureString
$passphrase = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($response))

# Generate key file script
$keyGenScript = @()
$keyGenScript += "%echo Generating a key"
$keyGenScript += "Key-Type: RSA"
$keyGenScript += "Key-Length: 2048"
$keyGenScript += "Subkey-Type: RSA"
$keyGenScript += "Subkey-Length: 2048"
$keyGenScript += "Passphrase: $passphrase"
$keyGenScript += "Name-Real: Chris Haigh"
$keyGenScript += "Name-Comment: Head of DevOps"
$keyGenScript += "Name-Email: cshaigh1981@gmail.com"
$keyGenScript += "Expire-Date: 1y"

# Do a commit here, so that we can later print "done" :-)
$keyGenScript += "%commit"
$keyGenScript += "%echo done"

# Write $keyGenScript to $keyGenScriptFile
$keyGenScript | Out-File -Encoding ascii $keyGenScriptFile

# Generate key using keyGenScript
& $gpgCmd --batch --gen-key $keyGenScriptFile

$key = Read-Host "What was the trusted key given above?"

# Set user key to have same key as pub
git config --global "user.signingkey" $key

# Verify
& $gpgCmd --list-key

# export key to ASCII-armored key (to upload to GitHub)
& $gpgCmd --armor --export "cshaigh1981@gmail.com"

# create a signed tag
git tag --sign "v1.0_signed" --message "Signed v1.0"

# try to verify unsigned tag (error: no signature found)
git tag --verify "v1.0_with_message"

# try to verify signed tag (Signed v1.0)
git tag --verify "v1.0_signed"