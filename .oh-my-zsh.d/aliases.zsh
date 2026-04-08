# My Git enablement aliases/functions
alias git-rebase='git-refresh && git rebase -i $(git merge-base $(git branch -r | awk "/HEAD ->/ { print \$NF }") $(git branch --show-current))'
alias git-refresh='git fetch --all -p && git rebase $(git branch -r | awk "/HEAD ->/ { print \$NF }")'
git-rebase-branch () {
  git fetch --all -p
  git rebase ${1}
  git-rebase -i $(git merge-base ${1} $(git branch --show-current))
}

# Other aliases
KUBECOLOR=$(which kubecolor 2> /dev/null)
if [[ -f "${KUBECOLOR}" ]]; then
  # If kubecolor is installed, lets use that instead of standard kubectl
  alias kubectl=${KUBECOLOR}
  compdef kubecolor=kubectl # Make "kubecolor" borrow the same completion logic as "kubectl"
fi
alias kc="kubectl"
KREW=$(which kubectl-krew 2> /dev/null)
if [[ -f "${KREW}" ]]; then
  alias krew=${KREW}
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

if [[ "$(uname -s)" == "Darwin" ]]; then
  # moving these under macos cause i will likely never need most of them on linux this way

  # these are general that i care about
  alias docker="podman"
  alias nano="$(brew --prefix nano)/bin/nano"
  alias python='podman run --rm -it -w /data -v /Users/gregswift:/data:Z ghcr.io/astral-sh/uv:python3.14-alpine uv run python'

  # these are typically dayjob oriented
  alias actionlint="go run github.com/rhysd/actionlint/cmd/actionlint"
  alias cue="go run cuelang.org/go/cmd/cue"
  alias kube-linter="go run golang.stackrox.io/kube-linter/cmd/kube-linter"
  #alias pulumi="docker run -it -e PULUMI_ACCESS_TOKEN -v $(pwd):/app pulumi/pulumi"
  alias sops="docker run --rm -it ghcr.io/getsops/sops:v3.12.1-alpine"
else
  alias jq="docker run --rm -i apteno/alpine-jq jq"
fi
