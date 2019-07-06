# Kubernetes Specific aliases
alias kubectl="`which kubectl` config view | grep 'server:' | sed -E -e 's/(.*)\/\/(.*)\.(.*)\.(.*)\.(.*)\.(.*)$/'"$(tput setaf 1)"'\2\.'"$(tput setaf 4)"'\3\.'"$(tput setaf 2)"'\4\.\5\.\6/'; tput setaf 3; echo Proceed?; tput op; read proceed; `which kubectl` "
alias k='kubectl --namespace'
alias unKube='unset KUBECONFIG; rm ~/.kube/config; unset CLUSTER; unset REGION;export PS1="\[\033[32m\]\t:\[\033[33;1m\]\W\[\033[34m\]\$(parse_git_branch 2> /dev/null)\[\033[00m\] > ";unset CONNECT; unset SUBSCRIPTION;'
export KUBE_EDITOR=vim

