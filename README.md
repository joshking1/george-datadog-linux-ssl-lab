# Datadog Linux, Apache & SSL/TLS Monitoring Lab

[![CI](https://github.com/joshking1/george-datadog-linux-ssl-lab/actions/workflows/ci.yml/badge.svg)](https://github.com/joshking1/george-datadog-linux-ssl-lab/actions/workflows/ci.yml)

**Audience:** Linux/web-server engineers · **Duration:** 2 hours · **Platform:** disposable Ubuntu 22.04/24.04 VM · **Scope:** training only, not production.

## Learning outcomes
- Collect live Linux CPU, memory, disk and network metrics using Datadog Agent.
- Enable Apache `mod_status` with local-only access and observe web-server metrics.
- Validate HTTPS certificate identity, trust and expiration using OpenSSL and curl.
- Configure Datadog HTTP checks, dashboard and safe test alerts.
- Investigate a controlled Apache outage and document recovery.

## Getting started
1. Follow [Datadog account setup](docs/DATADOG-ACCOUNT-SETUP.md) to register your own account. Review the current trial and billing terms. Never share API keys.
2. Use a **nonproduction** Ubuntu VM. An EC2 instance is optional and billed separately. For TLS, use a test domain that **already has working HTTPS**; this lab does not issue certificates.
3. Install prerequisites:
   ```bash
   sudo apt-get update
   sudo apt-get install -y apache2 curl openssl jq
   sudo systemctl enable --now apache2
   bash scripts/preflight.sh
   ```
4. Install Datadog Agent using your account-specific command from [official Agent onboarding](https://docs.datadoghq.com/agent/). Check `sudo datadog-agent status` and host telemetry.
5. Run `sudo bash scripts/configure-apache-status.sh`. Configure the Agent Apache integration using [the example](config/apache.d/conf.yaml.example), then restart the Agent.
6. Run `bash scripts/check-tls.sh your-test-domain.example`. Configure the HTTP integration using [the example](config/http_check.d/conf.yaml.example) and replace its placeholder URL.
7. Complete the [exercises](docs/EXERCISES.md) and [acceptance checklist](docs/VALIDATION.md).

## Two-hour agenda
| Time | Task | Evidence |
|---|---|---|
| 0–25 min | Linux + Agent | Host metrics |
| 25–50 min | Apache | Request metrics |
| 50–75 min | HTTPS + certificate | TLS verification |
| 75–100 min | Dashboards + alerts | Alert fired/resolved |
| 100–120 min | Incident drill + cleanup | Incident report |

## Safety and costs
- Lab environment only. Never intentionally interrupt a production service.
- Do not commit API keys, certificate private keys, credentials, or secret-bearing screenshots.
- `/server-status` must be accessible only from loopback; never expose it publicly.
- Review [Datadog pricing](https://www.datadoghq.com/pricing/) and AWS costs before starting. Some Datadog features may be separately billed.
- GitHub CI checks syntax, YAML and basic security hygiene. It does **not** prove live Datadog telemetry or certificate renewal.

## Documentation
[Account setup](docs/DATADOG-ACCOUNT-SETUP.md) · [Exercises](docs/EXERCISES.md) · [Validation](docs/VALIDATION.md) · [Troubleshooting](docs/TROUBLESHOOTING.md) · [Apache integration](https://docs.datadoghq.com/integrations/apache/) · [HTTP check](https://docs.datadoghq.com/integrations/http_check/)

Apache-2.0 licensed. See [LICENSE](LICENSE), [CONTRIBUTING.md](CONTRIBUTING.md), and [SECURITY.md](SECURITY.md).
