# Kubernetes Specific aliases
alias k='kubectl --namespace'
export KUBE_EDITOR=vim

# Golang path setup
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GPG_TTY=$(tty)
