# Level 04 - Configuration Courier

Create a ConfigMap containing `APP_MODE=production` and a Secret containing `API_TOKEN=change-me`. Inject the ConfigMap as an environment variable and mount the Secret at `/etc/app/token` in `config-checker`.

Verify both values from inside the pod without exposing the Secret in normal output.
