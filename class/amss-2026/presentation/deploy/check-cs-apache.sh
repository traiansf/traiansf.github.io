#!/usr/bin/env bash
# Validate the proxy snippet using Apache's installed modules, without sudo
# and without modifying or reloading the production configuration.
set -euo pipefail
app_root="$HOME/.local/share/amss-presentation"
cat > "$app_root/apache-check.conf" <<EOF
ServerRoot /etc/apache2
ServerName localhost
Listen 127.0.0.1:33108
PidFile $app_root/apache-check.pid
ErrorLog $app_root/apache-check.log
LoadModule mpm_event_module /usr/lib/apache2/modules/mod_mpm_event.so
LoadModule authz_core_module /usr/lib/apache2/modules/mod_authz_core.so
LoadModule authz_host_module /usr/lib/apache2/modules/mod_authz_host.so
LoadModule alias_module /usr/lib/apache2/modules/mod_alias.so
LoadModule proxy_module /usr/lib/apache2/modules/mod_proxy.so
LoadModule proxy_http_module /usr/lib/apache2/modules/mod_proxy_http.so
<VirtualHost 127.0.0.1:33108>
Include $app_root/app/deploy/cs-apache.conf
</VirtualHost>
EOF
apache2 -t -f "$app_root/apache-check.conf"
bash -n "$app_root/app/deploy/enable-cs-apache.sh"
