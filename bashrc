alias ls='ls -GF'
cd() { builtin cd "$@" && pwd && ls; };

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM="xterm-256color"

# Kubernetes Specific
#source <(kubectl completion bash)
export KUBE_EDITOR=vim
alias k='kubectl --namespace'
 [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)

# Golang path setup
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Git variables
# GPG commit password tty
export GPG_TTY=$(tty)

# Bash history
## append to history. Dont overwrite
shopt -s histappend
export HISTSIZE=1000
export HISTFILESIZE=2000
# Ignore dups and ignore starting with space
export HISTCONTROL=ignoreboth:erasedups
# Show date/time in bash history
export HISTTIMEFORMAT="%m/%d/%y %T "

# Connect to vpn
export OVPN_DIR=${HOME}/.ovpn
alias oServer="docker run -d --rm --name=oServer --env-file=${OVAPN_DIR}/credentials -p 22222:22 -p=18888:8080 --cap-add=NET_ADMIN --device /dev/net/tun --dns=8.8.8.8 -v ${OVPN_DIR}:/app:ro thatinfrastructureguy/ovpn-socks-proxy:v0.0.1"
alias oConnect="ssh -q -f -N -p 22222 -D 18888 -o 'UserKnownHostsFile=/dev/null' -o 'StrictHostKeyChecking=no' root@127.0.0.1"

# Mac Only
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="$PATH:/usr/local/opt/ruby/bin:$/usr/local/sbin:/usr/local/opt/gnupg@2.2/bin:/usr/local/opt/libpq/bin:/usr/local/sbin"

# Reload Yubikey
alias reload_yubikey='gpg-connect-agent "scd serialno" "learn --force" /bye'
alias refresh_shell="exec $SHELL -l"

# Yubikey-Agent requirement on mac os.
# export SSH_AUTH_SOCK="/usr/local/var/run/yubikey-agent.sock"
gpg-connect-agent updatestartuptty /bye > /dev/null
unset SSH_AGENT_PID
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# DSTASK
export DSTASK_GIT_REPO="$HOME/.config/dstask"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## Aliases
alias tt="docker container run -v ${HOME}/timetrace/:/data --rm -it -e TZ=America/Los_Angeles dominikbraun/timetrace"
alias t="dstask"
alias grr="grep -r --exclude-dir=.git"
alias pet="pet --config ~/code/dotfiles/pet/config.toml"

function prev() {
  PREV=$(echo `history | tail -n2 | head -n1` | cut -d' ' -f4-)
  sh -c "pet --config ~/code/dotfiles/pet/config.toml new `printf %q "$PREV"`"
}

# https://ohmyposh.dev
eval "$(oh-my-posh --init --shell bash --config ~/code/dotfiles/poshthemes/star.omp.json)"

# Jump: https://github.com/gsamokovarov/jump
eval "$(jump shell)"

# RipGrep
export FZF_DEFAULT_COMMAND='rg -L --files --no-ignore-vcs --hidden'

#function parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}
#
#export PS1="\[\e[32m\]\w \[\e[91m\]\$(parse_git_branch 2>/dev/null)\[\e[00m\]$ "

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ashishkulkarni/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ashishkulkarni/Downloads/google-cloud-sdk/path.bash.inc'; fi

# launch diary from command line:
alias diary='vim -c ":VimwikiMakeDiaryNote"'

# launch index page from command line
alias vw='vim -c ":VimwikiIndex"'

# convert a file into zettel
alias vz='vim -c ZettelCapture'

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ashishkulkarni/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ashishkulkarni/Downloads/google-cloud-sdk/completion.bash.inc'; fi
