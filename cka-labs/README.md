# CKA Labs

This project is a focused CKA study track for Kubernetes exam tasks only. It avoids broad platform/SRE work and stays centered on the Linux Foundation CKA domains:

- Cluster Architecture, Installation, and Configuration
- Workloads and Scheduling
- Services and Networking
- Storage
- Troubleshooting

## Lab roadmap

The full planned set is 25 hands-on labs.

1. Cluster health and node placement
2. Broken deployment diagnosis and fix
3. Scheduling with taints, tolerations, and node affinity
4. Workload scaling and rollout recovery
5. Service selector debugging and endpoint validation
6. NetworkPolicy enforcement
7. Ingress and hostname routing
8. CoreDNS troubleshooting
9. ConfigMaps and environment injection
10. Secrets and mounted credentials
11. Readiness and liveness probes
12. Job and CronJob patterns
13. StatefulSet ordering and stable identity
14. PersistentVolume and PVC troubleshooting
15. StorageClass and dynamic provisioning
16. RBAC authorization basics
17. ServiceAccount and pod-to-api access
18. Control-plane and kubelet logs
19. Node pressure and resource limits
20. CrashLoopBackOff diagnosis
21. Evictions and scheduler constraints
22. ImagePullBackOff and registry issues
23. Network connectivity from pod to service
24. CSI and volume mount failure analysis
25. Final cumulative CKA mock lab

## Current set

This repository contains Labs 1–5 as repeatable, hands-on scenarios with:

- a setup script that creates the initial environment and broken state
- a task description that does not reveal the fix
- a verification script that checks the learner's result
- a cleanup script so the lab can be run again

For a game-like progression through the same Kubernetes skills, see [`exercices/`](exercices/README.md). It contains 12 levels, including 8 runnable missions and 4 advanced briefs covering workloads, Services, networking, storage, RBAC and troubleshooting.

## Folder structure

```text
cka-labs/
├── README.md
├── exercices/
├── labs/
│   ├── 01-cluster-health-and-node-placement/
│   ├── 02-broken-deployment-fix/
│   ├── 03-scheduling-with-affinity/
│   ├── 04-service-debugging/
│   └── 05-storage-pvc-fix/
└── scripts/
```

Each lab includes:

- `README.md` — scenario and task instructions
- `setup.sh` — creates the namespace and initial state
- `solution.md` — exact commands and YAML, to read after attempting the lab
- `verify.sh` — automated validation for the expected state
- `cleanup.sh` — removes resources created by the lab

## Usage

1. Start a Kubernetes cluster and configure `kubectl` for it. A single-node cluster works for Labs 1, 2 and 4; Labs 3 and 5 need permission to label/taint a node and create a local PersistentVolume.
2. Run `./setup.sh` from the lab directory. This is the only preparation required.
3. Read the scenario and solve it without opening `solution.md`.
4. Run `./verify.sh` from the lab directory.
5. Compare your result with `solution.md`, then run `./cleanup.sh` before repeating the lab.

Every setup script refuses to run without `kubectl`, checks cluster access, and is safe to run again after cleanup. The scripts create only resources prefixed or namespaced for their lab; the node labels and taints used by Labs 1, 3 and 5 are removed by cleanup.

## Expected exam mindset

- Prefer kubectl and YAML over UI tools.
- Validate with exact commands, not assumptions.
- Fix root cause rather than patching symptoms.
- Re-check readiness, selectors, ports, labels, and resource constraints.
