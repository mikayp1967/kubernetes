# Installing metrics module

Base repo is located here:

    https://github.com/kubernetes-sigs/metrics-server

**For some reason it's not super straightforward on my env. According to the instructions:**

*Kubelet certificate needs to be signed by cluster Certificate Authority (or disable certificate validation by passing --kubelet-insecure-tls to Metrics Server)*

**It looks like it is on my cluster but still throws an error install by overwriting args:**

    helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
    helm upgrade --install metrics-server metrics-server/metrics-server -n kube-system --set 'args={--kubelet-insecure-tls}'
 
