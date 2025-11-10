# What OS are we running?
if [[ $(uname) == "Darwin" ]]; then
  source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
else

fi
#zinit light jonmosco/kube-ps1
#export PROMPT=${PROMPT}'$(kube_ps1)'
#export PS1='$(kube_ps1)'$PS1
