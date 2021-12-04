# USER SETUPS

Create users certs and bind them to roles
    add_kube_user.sh <user>
    bind_user.sh <user> <role> [<namespace>|default]

## Roles

I'v e written these in quirky yaml. Writing the api groups and verbs like that with the resources down easier to read cos I'm more focussed on the resources.

I currently have 2 "generic" type roles:

* user-role
Very little permissions. I'm just adding very slight observability

* dev-role
Prob a bit more access than a dev would need but hey ho. 
Pretty much full access on most namespaced resources

## Rolebinding

I made the robebinding a template using go/helm type tags cos why not...