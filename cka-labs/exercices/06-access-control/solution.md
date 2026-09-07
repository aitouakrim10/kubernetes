# Solution

```bash
kubectl create role pod-reader -n cka-ex-06 --verb=get,list,watch --resource=pods
kubectl create rolebinding auditor-read -n cka-ex-06 --role=pod-reader --serviceaccount=cka-ex-06:auditor
kubectl auth can-i list pods --as=system:serviceaccount:cka-ex-06:auditor -n cka-ex-06
kubectl auth can-i delete pods --as=system:serviceaccount:cka-ex-06:auditor -n cka-ex-06
./verify.sh
```
