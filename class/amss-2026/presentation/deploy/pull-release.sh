#!/usr/bin/env bash
# Poll a public GitHub release; no inbound SSH or GitHub credential is needed.
set -euo pipefail
umask 077
app_root="$HOME/.local/share/amss-presentation"
exec 8>"$app_root/pull.lock"
flock -n 8 || exit 0
work=$(mktemp -d "$app_root/pull.XXXXXX")
trap 'rm -rf "$work"' EXIT
release=https://github.com/traiansf/traiansf.github.io/releases/download/amss-live
curl -fsSL --retry 2 --connect-timeout 15 --max-time 90 \
  "$release/latest.json?check=$(date +%s)" -o "$work/latest.json"
read -r revision digest < <(python3 - "$work/latest.json" <<'PY'
import json, re, sys
data = json.load(open(sys.argv[1]))
if not re.fullmatch(r'[0-9a-f]{40}', data['revision']):
    raise SystemExit('Invalid revision')
if not re.fullmatch(r'[0-9a-f]{64}', data['sha256']):
    raise SystemExit('Invalid checksum')
print(data['revision'], data['sha256'])
PY
)
installed=$(cat "$app_root/installed-revision" 2>/dev/null || true)
if [ "$installed" = "$revision" ]; then
  exit 0
fi
curl -fsSL --retry 2 --connect-timeout 15 --max-time 180 \
  "$release/amss-presentation.tar.gz?revision=$revision" -o "$work/bundle.tar.gz"
printf '%s  %s\n' "$digest" "$work/bundle.tar.gz" | sha256sum -c -
bundle_revision=$(tar -xOzf "$work/bundle.tar.gz" dist/revision.txt)
test "$bundle_revision" = "$revision"
bash "$app_root/receive-ci.sh" < "$work/bundle.tar.gz"
printf '%s\n' "$revision" > "$app_root/installed-revision"
