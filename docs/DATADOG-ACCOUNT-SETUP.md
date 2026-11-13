# George: Datadog account setup

1. Visit https://www.datadoghq.com/free-datadog-trial/ and create an account with **your own email**. Verify your email and read the currently displayed trial duration and pricing; offers can change.
2. Note your Datadog **site/region** (for example `datadoghq.com` or `datadoghq.eu`). Use the same site for your Agent.
3. Open **Integrations / Agent installation** in Datadog, select Linux and your Ubuntu version, and copy the installation command generated for your account.
4. Run that command **only on the disposable lab VM**. The command may contain a secret API key. Never put it in GitHub, screenshots, chat, or shell history that you plan to share.
5. Run `sudo datadog-agent status`; verify the host appears under Infrastructure and emits CPU, memory and disk metrics.
6. Review https://www.datadoghq.com/pricing/ and the usage/billing page. Cloud VM, domain, logs and Synthetic Monitoring can incur separate charges. Delete unused resources after the lab.

If you cannot create an account, use Datadog's official support/help links. Do not ask someone else to send you their API key.

Official docs: https://docs.datadoghq.com/getting_started/agent/
