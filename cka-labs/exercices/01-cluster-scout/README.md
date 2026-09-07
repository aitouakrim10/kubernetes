# Level 01 - Cluster Scout

## Mission
A new platform team asks for a health report. Inspect the cluster and make the `scout` pod run only on a node labeled `role=worker`.

## Tasks

- Identify the current context and nodes.
- Create namespace `cka-ex-01`.
- Label one suitable node `role=worker`.
- Fix the pod so it runs on that node.
- Verify its IP, node and status.

Do not delete the pod or change the control-plane taint. See `solution.md` only after trying.
