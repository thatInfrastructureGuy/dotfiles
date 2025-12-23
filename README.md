## Get started

```sh
curl -L https://get.chezmoi.io -o install.sh

bash ./install.sh -b ./bin

ls ./bin/chezmoi
```

This is temporary install before chezmoi is installed by package-manager again.

### Init

Chezmoi expects https://github.com/$GITHUB_USERNAME/dotfiles for the command below to run. 

> [!IMPORTANT]
> Keys will not be published to keyservers going forward.
> Use https://github.com/thatInfrastructureGuy.gpg for public GPG key.
> Use https://github.com/thatInfrastructureGuy.keys for public SSH key.


```
./bin/chezmoi init --apply thatInfrastructureGuy
```

### TODO

1. Add `let g:zettel_options = [{"front_matter" : [["tags", ""], ["citations", ""]], "template" :  "~/.config/nvim_tig/.zettel.tpl"}]`

---

### Old Instructions

```sh
gpg --keyserver keyserver.ubuntu.com --recv-keys 7A53E1F55156C0EF

gpg-connect-agent updatestartuptty /bye > /dev/null
unset SSH_AGENT_PID
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# to commit with signing
export GPG_TTY=$(tty)
```
