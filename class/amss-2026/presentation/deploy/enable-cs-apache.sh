#!/usr/bin/env bash
# Run on cs.unibuc.ro as: sudo bash <path-to-this-file>
# Installs the narrow AMSS route in the existing HTTPS vhost only.
set -euo pipefail
if [ "$(id -u)" -ne 0 ]; then
  echo "Rulați acest script cu sudo pe cs.unibuc.ro." >&2
  exit 1
fi
script_dir=$(cd -- "$(dirname -- "$0")" && pwd)
vhost=/etc/apache2/sites-available/000-default-le-ssl.conf
snippet=/etc/apache2/amss-tserbanuta.conf
test -f "$vhost"
grep -q 'ServerName cs.unibuc.ro' "$vhost"
apache2ctl configtest
backup="${vhost}.amss-backup-$(date +%Y%m%d%H%M%S)"
cp -p -- "$vhost" "$backup"
install -m 644 "$script_dir/cs-apache.conf" "$snippet"
a2enmod proxy proxy_http
python3 - "$vhost" <<'PY'
from pathlib import Path
import sys
p = Path(sys.argv[1])
text = p.read_text()
include = 'Include /etc/apache2/amss-tserbanuta.conf'
if include not in text:
    assert text.count('</VirtualHost>') == 1, 'Verificați manual structura VirtualHost.'
    p.write_text(text.replace('</VirtualHost>', '    ' + include + '\n</VirtualHost>'))
PY
if ! apache2ctl configtest; then
  cp -p -- "$backup" "$vhost"
  echo "Configurația VirtualHost a fost restaurată; Apache nu a fost reîncărcat." >&2
  exit 1
fi
systemctl reload apache2
loginctl enable-linger tserbanuta
echo "Rută activată: https://cs.unibuc.ro/~tserbanuta/amss/"
echo "Copie de siguranță: $backup"
