if [[ "$(uname -s)" == "Darwin" ]]; then
  _total_cpus=$(sysctl -n hw.physicalcpu)
  _total_mem_gb=$(( $(sysctl -n hw.memsize) / 1024 / 1024 / 1024 ))

  if [[ $_total_mem_gb -ge 24 ]]; then
    # High-end machine (e.g. M5 Pro 24GB)
    export PODMAN_CPUS=6
    export PODMAN_MEMORY=12288
    export PODMAN_DISK=100
  elif [[ $_total_mem_gb -ge 16 ]]; then
    # Mid-range machine (e.g. 16GB)
    export PODMAN_CPUS=4
    export PODMAN_MEMORY=8192
    export PODMAN_DISK=60
  else
    # Older/lower-end machine (e.g. 8GB)
    export PODMAN_CPUS=2
    export PODMAN_MEMORY=4096
    export PODMAN_DISK=40
  fi

  unset _total_cpus _total_mem_gb
fi
