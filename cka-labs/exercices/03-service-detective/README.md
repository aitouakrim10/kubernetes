# Level 03 - Service Detective

The `api` pods are healthy but the Service has no usable endpoints. Fix the selector and target port, then prove access from another pod.

Tasks: inspect labels, Service ports and EndpointSlices; make `api-svc` reachable at port 80; test `http://api-svc`; explain the difference between `port` and `targetPort`.
