#!/usr/bin/env bash
set -euo pipefail
printf 'Host: '; hostname
printf 'OS: '; (. /etc/os-release; printf '%s\n' "$PRETTY_NAME")
printf 'Apache: '; if command -v apache2 >/dev/null; then apache2 -v | head -1; else echo 'not installed'; fi
printf 'Datadog Agent: '; if command -v datadog-agent >/dev/null; then datadog-agent version | head -1; else echo 'not installed'; fi
printf 'Disk usage:\n'; df -h /
printf 'HTTP/HTTPS listeners:\n'; ss -lnt | grep -E ':(80|443)[[:space:]]' || true
