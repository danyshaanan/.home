# Encrypted .dmg container
```bash
hdiutil create -size 10m -volname tenMegs -encryption AES-128 -fs "Journaled HFS+" -stdinpass 10m.dmg # Enter key
hdiutil attach 10m.dmg -mountpoint target -stdinpass #target need not exist
hdiutil detach target
```

# EncFS
```bash
brew install encfs
encfs `pwd`/.encrypted `pwd`/decrypted # directories need not exist, follow instructions
umount decrypted
```

# TrueCrypt
```bash
brew cask install truecrypt
truecrypt -t -c # follow instructions
truecrypt -t -k='' --protect-hidden=no 1g.tc dir
truecrypt -t -d dir
```
