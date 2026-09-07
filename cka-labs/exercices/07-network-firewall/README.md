# Level 07 - Network Firewall

Two pods exist: `client` must reach `api` on TCP 80, while `blocked` must not. Create a default-deny policy and then allow only the client-to-api path.

Test both paths from inside the cluster. This level requires a NetworkPolicy-capable CNI.
