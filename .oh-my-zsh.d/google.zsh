# Google Cloud SDK shell integration
# Check known install locations across macOS and Linux
for _gcloud_path in \
  "$(brew --prefix 2>/dev/null)/share/google-cloud-sdk" \
  "/usr/share/google-cloud-sdk" \
  "/usr/lib/google-cloud-sdk" \
  "$HOME/google-cloud-sdk"; do
  if [[ -f "${_gcloud_path}/path.zsh.inc" ]]; then
    source "${_gcloud_path}/path.zsh.inc"
    source "${_gcloud_path}/completion.zsh.inc"
    break
  fi
done
unset _gcloud_path
