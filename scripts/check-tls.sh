#!/usr/bin/env bash
set -euo pipefail
host="${1:?Usage: check-tls.sh hostname [port]}"
port="${2:-443}"
[[ "$host" =~ ^[A-Za-z0-9.-]+$ && "$port" =~ ^[0-9]+$ ]] || { echo 'Invalid hostname or port' >&2; exit 2; }
(( 10#$port >= 1 && 10#$port <= 65535 )) || { echo 'Port out of range' >&2; exit 2; }
cert=$(mktemp)
trap 'rm -f "$cert"' EXIT
if ! timeout 15 openssl s_client -connect "$host:$port" -servername "$host" -showcerts </dev/null 2>/dev/null | openssl x509 -out "$cert" 2>/dev/null; then
  echo 'TLS handshake or certificate extraction failed' >&2; exit 1
fi
openssl x509 -in "$cert" -noout -subject -issuer -dates
if openssl x509 -in "$cert" -noout -checkend 2592000; then
  echo 'Certificate valid for at least 30 more days'
else
  echo 'WARNING: certificate expires within 30 days' >&2
fi
# curl checks certificate chain, hostname, and HTTP response; do not use -k.
curl --fail --silent --show-error --location --max-time 15 --output /dev/null --write-out 'HTTP status: %{http_code}\n' "https://$host:$port/"
