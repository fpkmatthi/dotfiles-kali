# Dotfiles - Kali

My (@fpkmatthi) dotfiles for my Kali VM setup.
Method: https://www.atlassian.com/git/tutorials/dotfiles

From scratch setup:

```bash
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc

echo ".dotfiles" >> .gitignore
```

Example of adding dotfiles

```bash
config status
config add .tmux.conf
config commit -m "Add tmux.conf"
config add .zshrc
config commit -m "Add zshrc"
config push
```

Replicate on other systems:

```bash
git clone --bare https://github.com/fpkmatthi/dotfiles-kali $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
```
If error due to existing files (will remove them):

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

config checkout
config config --local status.showUntrackedFiles no
```

## Manual config

Notes to self:

- Disable xfwm4 in session and verify bspm/sxhkd autostart
- Remove default xfce4 keyboard shortcuts
- Rename workspaces to `&, é, ", ', (`
- Match the amount of workspaces with those in the bspwm config
