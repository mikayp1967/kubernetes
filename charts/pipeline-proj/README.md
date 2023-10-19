# simple-chart

This is just going to be doing some basic junk with a helm chart. I'll likely add resources like
PVs, deployments and maybe a slightly customeised nginx image but not interested in deveoping an app
here just doing the stuff that would sit round an app

I'll also create a bit of a mechanism for deployment to different namespace/environments with custom params.


## Installation:

$ kubectl create ns testing
$ cd kubernetes/charts/simple-chart
$ helm install --debug --dry-run goodly-guppy .

I needed to remove HPA to get it running, think I didn't bake metrics into base K8s build
