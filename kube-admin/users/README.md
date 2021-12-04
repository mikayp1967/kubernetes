# USER SETUPS

Create users certs and bind them to roles
    add_kube_user.sh <user>
    bind_user.sh <user> <role> [<namespace>|default]

## Roles

I've written these in quirky yaml. Writing the api groups and verbs like that with the resources down easier to read cos I'm more focussed on the resources.

I currently have 2 "generic" type roles:

* user-role
Very little permissions. I'm just adding very slight observability

* dev-role
Prob a bit more access than a dev would need but hey ho. 
Pretty much full access on most namespaced resources

To add new roles find the resource name, group and available verbs with:

    kubectl api-resources -o wide|grep <resource-name>

## Rolebinding

I made the robebinding a template using go/helm type tags cos why not...

## keys/certs

Keys and certs are written to /var/mycerts/<username>.<key|crt>
In the real world they would need shipping to the user by secure means - way outside
of the scope of what I'm doing here.
