# Jenkins Server

## Objectives

- Create a jenkins server running persistently
- Install it on the control plane server as better for external access
- This isn't about being pretty or comprehensive, just functional.



## To Do

- Add PVC to deployment - DONE
- Add Init Container to deployment to configure persistent volume permissions - DONE
- Tolerations to run it on CP - Pushing now to save changes, fails on master node cos of disk issues.
- External service IP address


## Installing

cd my_jenkins
helm upgrade --install  jenkins .

