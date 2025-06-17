## Get started

```sh
curl -L https://get.chezmoi.io -o install.sh

bash ./install.sh -b ./bin

ls ./bin/chezmoi
```

This is temporary install before chezmoi is installed by package-manager again.

### Init

Chezmoi expects https://github.com/$GITHUB_USERNAME/dotfiles for the command below to run. 

```
./bin/chezmoi init --apply thatInfrastructureGuy
```

### TODO

1. Add `let g:zettel_options = [{"front_matter" : [["tags", ""], ["citations", ""]], "template" :  "~/.config/nvim_tig/.zettel.tpl"}]`
