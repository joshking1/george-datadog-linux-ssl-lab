# Troubleshooting

**No host in Datadog:** Check `sudo datadog-agent status`, outbound HTTPS, site/region, permissions and Agent logs.

**No Apache metrics:** Check `curl -fsS 'http://127.0.0.1/server-status?auto'`; confirm `mod_status` and Apache integration configuration. Do not make the status endpoint public.

**No HTTPS:** Check DNS, port 443, Apache virtual host, TLS certificate chain, firewall and the authorized test hostname. This lab does not provision HTTPS.

**TLS check fails:** Use `bash scripts/check-tls.sh YOUR_TEST_DOMAIN` and inspect errors. Do not use `curl -k` to bypass validation.

**No alerts:** Check the monitor query, lab host tags, evaluation window, notification destination and metric ingestion delay.

**Unexpected charges:** Review Datadog usage and any EC2/domain billing; remove test monitors and terminate disposable resources.
