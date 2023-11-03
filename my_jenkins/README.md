# Jenkins Server

Create a helm chart to build a minimally functional Jenkins server. This isn't the goal, just a pre-requisite for creating pipelines.
And on that note - guess it's done enough for now.


## Objectives

- Create a jenkins server running persistently
- Install it on the control plane server as better for external access
- This isn't about being pretty or comprehensive, just functional.



## To Do

- Add PVC to deployment - DONE
- Add Init Container to deployment to configure persistent volume permissions - DONE
- Tolerations to run it on CP - DONE
- External service IP address


## Installing

cd my_jenkins
helm upgrade --install  jenkins .

