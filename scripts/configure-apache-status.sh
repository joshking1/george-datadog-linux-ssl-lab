#!/usr/bin/env bash
set -euo pipefail
[[ "$EUID" -eq 0 ]] || { echo 'Run as root (sudo)' >&2; exit 1; }
command -v apache2ctl >/dev/null || { echo 'Apache not installed' >&2; exit 1; }
a2enmod status >/dev/null
cat > /etc/apache2/conf-available/george-lab-status.conf <<'CONF'
ExtendedStatus On
<Location "/server-status">
    SetHandler server-status
    Require local
</Location>
CONF
a2enconf george-lab-status >/dev/null
apache2ctl configtest
systemctl reload apache2
curl -fsS 'http://127.0.0.1/server-status?auto' | head -15
