# Lab 05 - Storage and PVC troubleshooting

## Domain
Storage

## Scenario
The setup script creates a local PersistentVolume, a deliberately incorrect PVC, and a pod that uses the claim. The pod is Pending. Diagnose the claim and make the application start without changing the PV.

## Task

1. Inspect the PVC, PV, pod, and events.
2. Determine whether the storage class, access mode, or volume claim size is invalid.
3. Correct the PVC setup without deleting the PersistentVolume.
4. Ensure the pod mounts the volume and reaches Ready state.

## Constraints

- Keep the application name and namespace consistent.
- Use a valid storage class available in the cluster.
- Do not create an unsupported or impossible PVC request.

## Expected outcome

- PVC binds successfully.
- Pod mounts the storage volume.
- Application starts without pending volume errors.

## Start and reset

```bash
./setup.sh
```

After solving the task, run `./verify.sh`. Use `./cleanup.sh` to reset the lab. The setup needs permission to label one node and create a local PersistentVolume.

## Files

- solution.md
- verify.sh
