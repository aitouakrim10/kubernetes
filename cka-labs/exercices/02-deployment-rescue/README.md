# Level 02 - Deployment Rescue

## Mission
The `web` Deployment is serving the wrong version and never becomes ready. Restore it without deleting the Deployment.

## Tasks

- Find why the rollout is unhealthy.
- Make the Deployment use `nginx:1.25` with 3 replicas.
- Add a readiness probe on `/` port 80.
- Wait for a successful rollout and inspect rollout history.
- Practice scaling to 4, then return to 3 replicas.
