export EDITOR=nano
# Disable warnings that podman-compose is running instead of docker-compose
export PODMAN_COMPOSE_WARNING_LOGS=false

# For my makefiles
export CONTAINER_ENGINE=podman


# Any OS specific pathing changes
if [[ $(uname) == "Darwin" ]]; then
  # Configure Helm's registry config file because kustomize overrides most of the
  # settings, which makes accessing and authenticated helm registry fail
  export HELM_REGISTRY_CONFIG=~/Library/Preferences/helm/registry/config.json
else
  export HELM_REGISTRY_CONFIG=~/.config/helm/registry/config.json
fi
