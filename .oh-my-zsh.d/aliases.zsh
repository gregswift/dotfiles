alias actionlint="go run github.com/rhysd/actionlint/cmd/actionlint"
alias cue="go run cuelang.org/go/cmd/cue"
alias docker="podman"
alias git-rebase='git-refresh && git rebase -i $(git merge-base $(git branch -r | grep -Po "HEAD -> \K.*$") $(git branch --show-current))'
alias git-refresh='git fetch --all -p && git rebase $(git branch -r | grep -Po "HEAD -> \K.*$")'
alias jq="docker run --rm -i apteno/alpine-jq jq"
alias kube-linter="go run golang.stackrox.io/kube-linter/cmd/kube-linter"
alias pulumi="docker run -it -e PULUMI_ACCESS_TOKEN -v $(pwd):/app pulumi/pulumi"
alias sops="docker run --rm -it ghcr.io/getsops/sops:v3.12.1-alpine"


git-rebase-branch () {
  git fetch --all -p
  git rebase ${1}
  git-rebase -i $(git merge-base ${1} $(git branch --show-current))
}
