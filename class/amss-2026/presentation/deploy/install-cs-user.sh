#!/usr/bin/env bash
# Install a prebuilt bundle as tserbanuta, without changing system Node/Apache.
set -euo pipefail
test "$(id -un)" = tserbanuta
umask 077
app_root="$HOME/.local/share/amss-presentation"
mkdir -p "$app_root/app" "$app_root/runtime" "$HOME/.config/amss-presentation" "$HOME/.config/systemd/user"
tar -xzf "$HOME/amss-presentation-deploy.tar.gz" -C "$app_root/app"
node_release=node-v24.21.0-linux-x64
node_sha=fd8e59d5a511510f6a298afb548f18c7d2b1be404d8b4a27d94fbe49f56cb2d6
if [ ! -x "$app_root/runtime/$node_release/bin/node" ]; then
  curl -fsS --max-time 120 "https://nodejs.org/dist/v24.21.0/$node_release.tar.xz" -o "$app_root/runtime/$node_release.tar.xz"
  (cd "$app_root/runtime" && printf '%s  %s\n' "$node_sha" "$node_release.tar.xz" | sha256sum -c -)
  tar -xJf "$app_root/runtime/$node_release.tar.xz" -C "$app_root/runtime"
fi
ln -sfn "$node_release" "$app_root/runtime/node"
export PATH="$app_root/runtime/node/bin:$PATH"
cd "$app_root/app"
npm ci --omit=dev --ignore-scripts
if [ ! -f "$HOME/.config/amss-presentation/environment" ]; then
  python3 - <<'PY'
from pathlib import Path
import secrets
p = Path.home() / '.config/amss-presentation/environment'
p.write_text('HOST=127.0.0.1\nPORT=3107\nBASE_PATH=/~tserbanuta/amss\nPRESENTATION_PASSWORD=' + secrets.token_urlsafe(24) + '\n')
p.chmod(0o600)
PY
fi
install -m 600 deploy/cs-user.service "$HOME/.config/systemd/user/amss-presentation.service"
install -m 700 deploy/pull-release.sh "$app_root/pull-release.sh"
install -m 700 deploy/receive-ci.sh "$app_root/receive-ci.sh"
install -m 600 deploy/cs-update.service "$HOME/.config/systemd/user/amss-update.service"
install -m 600 deploy/cs-update.timer "$HOME/.config/systemd/user/amss-update.timer"
systemctl --user daemon-reload
systemctl --user enable amss-presentation.service
systemctl --user enable --now amss-update.timer
systemctl --user restart amss-presentation.service
for attempt in 1 2 3 4 5; do
  if curl -fsS http://127.0.0.1:3107/~tserbanuta/amss/health; then
    printf '\nServiciul AMSS este pornit pe interfața locală.\n'
    exit 0
  fi
  sleep 1
done
exit 1
