# gpg

Resources:
* [github.com](https://help.github.com/articles/signing-commits-using-gpg)
* [git-scm.com](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work)
* [pgp.mit.edu](https://pgp.mit.edu)
* [keys.gnupg.net](http://keys.gnupg.net)

```bash
# get gnupg2 and pinentry:
brew install gnupg2 pinentry

# Generate a key:
gpg --gen-key
# See your generated key:
gpg --list-secret-keys
# Get your KEYID with:
gpg --list-secret-keys --keyid-format LONG | head -3 | grep -o '[0-9A-F]\{16\}'
# configure ~/.gnupg/gpg.conf with at least `keyserver hkp://keys.gnupg.net`
echo 'keyserver hkp://keys.gnupg.net' >> ~/.gnupg/gpg.conf
# Upload your key:
gpg --send-key FINGERPRINT

# Get an ascii-armored public key:
gpg --armor --export KEYID

# Download someones key:
gpg --recv-keys SOMEONESKEYID
# Verify fingerprint:
gpg --fingerprint SOMEONESKEYID
# Sign it:
gpg --sign-key SOMEONESKEYID
# Send it:
gpg --send-key SOMEONESKEYID

# Set git options
git config --global user.signingkey KEYID
git config --global commit.gpgsign true
# and exclude per repo: git config commit.gpgsign false

# Activate the gpg daemon:
export GPG_TTY=$(tty) # Move to bashrc
eval $(gpg-agent --daemon) # alias gpga='eval $(gpg-agent --daemon)'

# Create a tag with `-s`:
git tag -s v0.0.0 -m 'version 0.0.0'
# Verify with:
git tag -v v0.0.0

# Create a commit with `-S`:
git commit -S -m 'some changes'
# Verify with:
git log --show-signature # or with:
git show SHA --show-signature
```

`~/.gnupg/gpg.conf`:
```
charset utf-8
keyserver hkps://hkps.pool.sks-keyservers.net
keyserver-options ca-cert-file=/Users/YOU/.gnupg/sks-keyservers.netCA.pem
keyserver-options no-include-revoked
keyserver-options no-honor-keyserver-url
keyserver-options no-try-dns-srv
require-cross-certification
use-agent
```

`~/.gnupg/gpg-agent.conf`:
```
use-standard-socket
pinentry-program /usr/local/bin/pinentry
```
