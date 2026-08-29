# Storage

## 1. Why storage matters

Containers are ephemeral. If a Pod restarts, its container filesystem is usually lost. Kubernetes provides persistent storage through volumes and storage classes so data survives Pod restarts and node changes.

---

## 2. Volumes

A volume is storage attached to a Pod. It can be local, network-backed, or cloud-provided.

Example:

```yaml
volumes:
- name: app-data
  emptyDir: {}
```

`emptyDir` is temporary and tied to the Pod lifecycle.

---

## 3. PersistentVolume (PV)

A PersistentVolume is a piece of storage in the cluster.

It can be:

- NFS-backed
- block storage
- cloud disk storage
- local storage

### Key attributes

- capacity
- access modes
- reclaim policy
- storage class

```bash
kubectl get pv
kubectl describe pv <pv-name>
```

---

## 4. PersistentVolumeClaim (PVC)

A PVC is a request for storage by a user or workload.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
```

Then a Pod can mount it:

```yaml
volumes:
- name: app-data
  persistentVolumeClaim:
    claimName: app-pvc
```

---

## 5. StorageClass

A StorageClass defines how a dynamic provisioner creates storage automatically.

Common storage drivers include:

- AWS EBS
- Azure Disk
- GCE PD
- Ceph
- NFS

```bash
kubectl get storageclass
```

This is very important for dynamic provisioning.

---

## 6. Access modes

Typical persistent volume access modes:

- ReadWriteOnce (RWO)
- ReadOnlyMany (ROX)
- ReadWriteMany (RWX)

Example:

```bash
kubectl get pv -o wide
```

---

## 7. Reclaim policy

When a PVC is deleted, the PV may be:

- Retain
- Recycle
- Delete

The reclaim policy controls whether the underlying storage is preserved or deleted.

---

## 8. Practical storage flow

1. Create a StorageClass
2. Create a PVC
3. Bind to a PV dynamically or statically
4. Mount the volume into the Pod
5. Store application data

---

## 9. Troubleshooting storage

Common issues:

- PVC Pending
- PV not bound
- StorageClass missing
- disk not mounted
- permission issues

Check:

```bash
kubectl get pvc
kubectl get pv
kubectl describe pvc <pvc-name>
kubectl describe pv <pv-name>
```

---

## 10. Lab exercises

### Exercise 1: Create a PVC

```bash
kubectl apply -f pvc.yaml
kubectl get pvc
```

### Exercise 2: Use it in a Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: app-pod
spec:
  containers:
  - name: app
    image: nginx
    volumeMounts:
    - name: app-data
      mountPath: /usr/share/nginx/html
  volumes:
  - name: app-data
    persistentVolumeClaim:
      claimName: app-pvc
```

---

## 11. Quick revision notes

- Pods are ephemeral; volumes give persistence.
- PVs are cluster storage resources.
- PVCs are user requests for storage.
- StorageClasses enable dynamic provisioning.
- Access modes define how storage can be used.
- Storage is a key part of production-ready workloads.

---

## 12. Sample questions

1. What is the difference between a PV and a PVC?
2. Why is a StorageClass useful?
3. What does `ReadWriteOnce` mean?
4. What happens when a PVC is deleted?
5. Why is `emptyDir` not persistent?
