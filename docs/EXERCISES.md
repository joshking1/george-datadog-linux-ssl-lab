# Guided exercises (120 minutes)

## 1. Baseline (25 minutes)
Install the Agent on an isolated Linux VM and verify the host in Datadog. Record CPU, memory, disk, and network usage. Compare to `top`, `free -m`, and `df -h`.

## 2. Apache metrics (25 minutes)
Run `sudo bash scripts/configure-apache-status.sh`. Ensure `curl -fsS 'http://127.0.0.1/server-status?auto'` succeeds. Configure the Datadog Apache integration. Generate 50 harmless local requests: `for i in $(seq 1 50); do curl -fsS http://127.0.0.1/ >/dev/null; done`. Inspect requests in Metrics Explorer. Confirm the status endpoint is **not** remotely accessible.

## 3. HTTPS and certificate (25 minutes)
Use an HTTPS test domain you control or are authorized to test. Run `bash scripts/check-tls.sh YOUR_TEST_DOMAIN`. Record the issuer, expiration date, HTTP status, and hostname verification. Configure the Datadog HTTP check and inspect its status/expiry telemetry.

## 4. Dashboards and alerts (25 minutes)
Create a dashboard with CPU, memory, disk, Apache requests, and HTTPS/TLS status. Create a monitor scoped to the lab host and temporarily choose a threshold near the observed metric to generate a safe test alert. Capture fired/resolved notifications; restore the normal threshold.

## 5. Incident response and cleanup (20 minutes)
**Only on your disposable VM**, stop Apache using `sudo systemctl stop apache2`; observe monitoring detection and delay. Restore with `sudo systemctl start apache2`. Verify recovery. Remove test monitors, review billing, and shut down the lab VM.

## Evidence to submit
- Host telemetry screenshot (without API keys)
- Apache request metric
- Certificate issuer, expiry and HTTPS validation result
- Alert fired and resolved
- Short incident report: detection, diagnosis, recovery and monitoring lag
