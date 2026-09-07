# Solution

```bash
kubectl get deploy,pods -n cka-ex-02
kubectl describe pod -n cka-ex-02 -l app=web
kubectl set image deployment/web web=nginx:1.25 -n cka-ex-02
kubectl edit deployment/web -n cka-ex-02
# Set readinessProbe.httpGet.path to / and port to 80.
kubectl scale deployment/web --replicas=4 -n cka-ex-02
kubectl scale deployment/web --replicas=3 -n cka-ex-02
kubectl rollout status deployment/web -n cka-ex-02
./verify.sh
```

The failure is caused by both the old image requirement and a probe targeting a path and port where nginx is not listening.
