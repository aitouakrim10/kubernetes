# Kubernetes CKA Exercises

A game-like Kubernetes practice path. Each level gives you a broken or incomplete cluster and a mission. Solve it with `kubectl`, verify your result, then reset and try again.

This directory is separate from `labs/`: the labs are guided CKA scenarios; these exercises are short missions designed for repetition and speed.

## Rules of the game

1. Use a disposable Kubernetes cluster and configure `kubectl` first.
2. Enter one exercise directory and run `./setup.sh`.
3. Read only `README.md`; do not open `solution.md` until you have tried.
4. Investigate with `kubectl get`, `describe`, `logs`, `exec`, and JSONPath.
5. Run `./verify.sh`. A successful verification is your score for the level.
6. Run `./cleanup.sh` before replaying or starting another level.

## Campaign

| Level | Mission | Main skills |
|---|---|---|
| 01 | Cluster Scout | nodes, namespaces, labels, contexts |
| 02 | Deployment Rescue | Deployments, rollout, probes, scaling |
| 03 | Service Detective | selectors, ports, endpoints, DNS |
| 04 | Configuration Courier | ConfigMaps, Secrets, env and volumes |
| 05 | Storage Vault | PV, PVC, access modes, mounts |
| 06 | Access Control | ServiceAccounts, RBAC, authorization |
| 07 | Network Firewall | NetworkPolicy and pod connectivity |
| 08 | Incident Commander | logs, events, scheduling, CrashLoopBackOff |
| 09 | Stateful Workshop | StatefulSet, stable identity, headless Service |
| 10 | Batch Factory | Jobs, CronJobs, completion and failure |
| 11 | Node Pressure | requests, limits, taints, tolerations |
| 12 | CKA Boss Fight | cumulative timed troubleshooting mission |

Start with `01-cluster-scout`, then progress in order. Levels 01, 02, 03, 04, 06, 08, 09 and 10 work on a single-node cluster. Levels 05, 07 and 11 may need a cluster that permits local storage, NetworkPolicy enforcement, or node labeling/tainting.


## Exercise 

Runnable levels 01-08 contain:

- `README.md` - mission, constraints and objectives
- `setup.sh` - creates the challenge
- `verify.sh` - checks the expected state
- `solution.md` - explanation and commands, opened after the attempt
- `cleanup.sh` - removes only resources owned by the exercise

Levels 09-12 are advanced mission briefs to implement and replay using the patterns from levels 01-08.

## CKA skill map

- Architecture and installation: 01, 08, 11
- Workloads and scheduling: 02, 08, 09, 10, 11
- Services and networking: 03, 07, 09
- Storage: 05
- Troubleshooting: 02, 03, 08, 11, 12
- Security: 04, 06, 07
