# Acceptance checklist

- [ ] Isolated Ubuntu VM and Apache installed
- [ ] Datadog account created with correct site
- [ ] Agent healthy; host metrics visible
- [ ] Apache status endpoint accessible from localhost only
- [ ] Apache metrics visible in Datadog
- [ ] Authorized HTTPS test domain with valid certificate
- [ ] TLS hostname and chain verified (no insecure curl flags)
- [ ] Certificate expiry date recorded
- [ ] Datadog HTTP/TLS integration reporting
- [ ] Dashboard showing current metrics
- [ ] Lab-only alert triggered and resolved
- [ ] Controlled Apache outage detected and recovered
- [ ] Billing reviewed; disposable resources cleaned up

**CI scope:** syntax, lint, YAML and basic hygiene only. It cannot verify Datadog ingestion or a live HTTPS endpoint. A passing CI badge is not a production certification.
