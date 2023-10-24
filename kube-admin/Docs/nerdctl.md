# NERDCTL CONTAINERD CLI

## INSTALL

    https://github.com/containerd/nerdctl/releases


    wget https://github.com/containerd/nerdctl/releases/download/v1.6.0/nerdctl-1.6.0-linux-amd64.tar.gz
    tar Cxzvvf /usr/local/bin nerdctl-0.15.0-linux-amd64.tar.gz


## NAMESPACED COMMANDS

Most commands seem to be namespaced and pull requires full repo path

- List Namespaces
  - crt ns ls
  - nerdctl ns ls
- Set default Namespace
  - export CONTAINERD_NAMESPACE=moby                    Set default namespace (moby for docker, k8s.io for kubernetes)
  - export CONTAINERD_NAMESPACE=k8s.io			        Set default NS (to Kube)



## Basic commands (same as Docker really)

nerdctl logs <CID>


## REFERENCES

    https://medium.com/nttlabs/nerdctl-359311b32d0e
    https://github.com/containerd/nerdctl
