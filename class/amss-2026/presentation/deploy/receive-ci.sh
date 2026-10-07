#!/usr/bin/env bash
# Install a CI-built tar.gz received on stdin (also used by pull-release.sh).
set -euo pipefail
umask 077
app_root="$HOME/.local/share/amss-presentation"
exec 9>"$app_root/deploy.lock"
flock -w 300 9
bundle=$(mktemp "$app_root/ci-bundle.XXXXXX")
trap 'rm -f "$bundle"' EXIT
cat > "$bundle"
# Refuse unexpected paths, symlinks and device entries before extraction.
python3 - "$bundle" <<'PY'
import sys, tarfile
from pathlib import PurePosixPath
with tarfile.open(sys.argv[1], 'r:gz') as archive:
    names = set()
    for member in archive:
        path = PurePosixPath(member.name)
        if (path.is_absolute() or '..' in path.parts or not path.parts
            or path.parts[0] not in {'dist', 'deploy', 'server.mjs', 'package.json', 'package-lock.json'}
            or not (member.isfile() or member.isdir())):
            raise SystemExit('Invalid deployment archive entry')
        names.add(member.name)
    if not {'dist/decks.json', 'server.mjs', 'package.json', 'package-lock.json',
            'deploy/install-cs-user.sh'} <= names:
        raise SystemExit('Incomplete deployment archive')
PY
mv "$bundle" "$HOME/amss-presentation-deploy.tar.gz"
# Use the installer already installed by the instructor.
bash "$app_root/app/deploy/install-cs-user.sh"
printf 'Deployed revision: '
cat "$app_root/app/dist/revision.txt"
