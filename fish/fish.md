#fish

```bash
brew install fish
sudo su
sudo echo /usr/local/bin/fish >> /etc/shells
exit
chsh -s /usr/local/bin/fish # to revert: chsh -s /bin/bash

fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher edc/bass
```
