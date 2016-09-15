#fish

```bash
ln -s ~/.{home,config}/fish
brew install fish
sudo sh -c "echo /usr/local/bin/fish >> /etc/shells"
chsh -s /usr/local/bin/fish # to revert: chsh -s /bin/bash

fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher edc/bass
```
