alias ls='ls -GF'
cd() { builtin cd "$@" && pwd && ls; };

# Mac Specific
export BASH_SILENCE_DEPRECATION_WARNING=1

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
export HISTCONTROL=ignoreboth
# Show date/time in bash history
export HISTTIMEFORMAT="%m/%d/%y %T "

# Connect to vpn
export OVPN_DIR=${HOME}/.ovpn
alias oServer="docker run -d --rm --name=oServer --env-file=${OVPN_DIR}/credentials -p 22222:22 -p=18888:8080 --cap-add=NET_ADMIN --device /dev/net/tun -v ${OVPN_DIR}:/app:ro thatinfrastructureguy/ovpn-socks-proxy:v0.0.1"
alias oConnect="ssh -q -f -N -p 22222 -D 18888 -o 'UserKnownHostsFile=/dev/null' -o 'StrictHostKeyChecking=no' root@127.0.0.1"
