alias ls='ls -GF'
cd() { builtin cd "$@" && pwd && ls; };

# Mac Specific
export BASH_SILENCE_DEPRECATION_WARNING=1

# Kubernetes Specific
#source <(kubectl completion bash)
export KUBE_EDITOR=vim
alias k='kubectl --namespace'

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
