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

This repository currently contains Labs 1–5 as exam-style scenarios with:

- a realistic task description
- a guided solution
- a verification script

## Folder structure

```text
lab/cka-labs/
├── README.md
├── labs/
│   ├── 01-cluster-health-and-node-placement/
│   ├── 02-broken-deployment-fix/
│   ├── 03-scheduling-with-affinity/
│   ├── 04-service-debugging/
│   └── 05-storage-pvc-fix/
└── scripts/
```

Each lab includes:

- README.md — scenario and task instructions
- solution.md — exact commands and YAML
- verify.sh — automated validation for the expected state

## Usage

1. Start from a working Kubernetes cluster with kubectl configured.
2. Read the scenario in the lab directory.
3. Solve it on the cluster.
4. Run the lab verification script.
5. Compare your result with the solution.

## Expected exam mindset

- Prefer kubectl and YAML over UI tools.
- Validate with exact commands, not assumptions.
- Fix root cause rather than patching symptoms.
- Re-check readiness, selectors, ports, labels, and resource constraints.
