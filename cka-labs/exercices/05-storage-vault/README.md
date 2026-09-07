# Level 05 - Storage Vault

Bind the `vault-claim` PVC to a usable volume and mount it in `vault`. The application must write `/data/proof.txt` and retain it after a pod restart.

Inspect StorageClasses and PV/PVC events. Do not use `emptyDir`.
