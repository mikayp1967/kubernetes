# NERDCTL CONTAINERD CLI

## INSTALL

https://github.com/containerd/nerdctl
https://github.com/containerd/nerdctl/releases


    wget https://github.com/containerd/nerdctl/releases/download/v0.15.0/nerdctl-0.15.0-linux-amd64.tar.gz
    tar Cxzvvf /usr/local/bin nerdctl-0.15.0-linux-amd64.tar.gz

## NAMESPACED COMMANDS

Most commands seem to be namespaced and pull requires full repo path

    export CONTAINERD_NAMESPACE=moby                    Set default namespace (moby for docker, k8s.io for kubernetes)    


Most commands are pretty much the same as docker versions