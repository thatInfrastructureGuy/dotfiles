alias ls='ls -GF'
cd() { builtin cd "$@" && pwd && ls; };

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export TERM="xterm-256color"

# Kubernetes Specific
#source <(kubectl completion bash)
export KUBE_EDITOR=vim
alias k='kubectl --namespace'
source <(kubectl completion bash)

# Golang path setup
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Git variables
# GPG commit password tty
export GPG_TTY=$(tty)

# Bash history 
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
export PATH="$PATH:/usr/local/opt/ruby/bin:$/usr/local/sbin:/usr/local/opt/gnupg@2.2/bin:/usr/local/opt/libpq/bin"

# Reload Yubikey
alias reload_yubikey='gpg-connect-agent "scd serialno" "learn --force" /bye'
alias refresh_shell="exec $SHELL -l"

# Yubikey-Agent requirement on mac os.
# export SSH_AUTH_SOCK="/usr/local/var/run/yubikey-agent.sock"
gpg-connect-agent updatestartuptty /bye > /dev/null
unset SSH_AGENT_PID
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## Aliases
alias tt="docker container run -v ${HOME}/timetrace/:/data --rm -it -e TZ=America/Los_Angeles dominikbraun/timetrace"
alias t="dstask"
alias grr="grep -r --exclude-dir=.git"

# https://ohmyposh.dev
eval "$(oh-my-posh --init --shell bash --config ~/code/dotfiles/poshthemes/star.omp.json)"
