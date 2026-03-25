# Any OS specific pathing changes
if [[ $(uname) == "Darwin" ]]; then
  alias assume="source /opt/homebrew/bin/assume"
else
  alias assume="source assume"
fi

# https://github.com/fwdcloudsec/granted/issues/547
#export GRANTED_ENABLE_AUTO_REASSUME=true

fpath=(~/.granted/zsh_autocomplete/assume/ $fpath)

fpath=(~/.granted/zsh_autocomplete/granted/ $fpath)
