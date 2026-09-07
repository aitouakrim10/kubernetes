# Level 06 - Access Control

Create ServiceAccount `auditor` and Role `pod-reader` in `cka-ex-06`. Bind them so the account can `get`, `list` and `watch` pods, but cannot delete them.

Use `kubectl auth can-i` to prove both allowed and denied actions.
