# Lab 04 - Service debugging and endpoint validation

## Domain
Services and Networking

## Scenario
The setup script has created a healthy backend and a Service that does not route traffic to it. Diagnose the selector/port problem and repair the Service.

## Task

1. Confirm the deployment, pod labels, and listening port.
2. Identify why the Service has no healthy endpoints.
3. Fix the Service or workload selector to match the pod labels.
4. Check that traffic reaches the backend successfully.

## Constraints

- Preserve the application names and namespace.
- Use a working Service type for cluster-internal traffic.
- Ensure the port and targetPort values are valid.

## Expected outcome

- Service has a valid endpoint.
- Backend is reachable via the Service.
- Pods respond on the expected port.

## Start and reset

```bash
./setup.sh
```

After solving the task, run `./verify.sh`. Use `./cleanup.sh` to reset the lab.

## Files

- solution.md
- verify.sh
