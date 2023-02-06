### hello-workflow

Deploy a temporal cluster for production - 
For my 48 hrs of this assessment, the hello-workflow was deployed to Amazon EKS, however now my account has been suspended cause they couldn't charge it with my master card, therefore I was unable to get the url.
Here are the steps I followed:
- I created an AWS account
- I created an Amazon ECR to push my docker images to
- I created a cluster under Amazon EKS, set up a single node and some security measures.
- Using aws cli, I created my kube-config file on my cluster and applied my two deployment.yml file on my clusters
- I confirmed the pods were running and tested on web browser
- I didn't use any load balancer in this assessment cause I wasn't planning to scale the pods and share the requests.


Package this temporal app as a docker image - The starter and worker app has been packaged as image in the Dockerfile. 
```bash
docker-compose up
```
can be used to start the server
and 
```bash
go run ./src/worker/main.go
```
to manually start the worker
```bash
go run .src/starter/main.go
```
to manually execute the workflow.


write a CICD for the app - the CI/CD pipeline file is in.github/workflows/main.yml, the jobs in the file are triggered once there is a push or pull request to the main branch. The jobs builds the starter and worker as two separate images and pushes them to Amazon ECR and the deployment job applies the files in deployments folder which also has the image of starter and worker to the pods in the kubernetes cluster for any change.

deploy the app using Kubernetes - The app is deployed using kubernetes and the help of [helm-charts](https://github.com/temporalio/helm-charts), and following the readme file for helm-charts, my PC port was forwarded to temporal-web ui and temporal frontend, then access it on localhost:8080

How would you improve this app - First would be restructuring the folders, everything seem a little bit clumsy and everywhere.
I would also want to have the temporal-server as light weight without having to bring in postgresql, cassandra and the likes except they're needed.

Here's a screenshot running on a local kubernetes cluster as pods
<div>
    <img width="840" alt="Screenshot 2023-02-06 at 00 34 44" src="https://user-images.githubusercontent.com/47679952/216852408-3ecb4040-0353-4355-a2c2-d760ab4aa939.png">
    
</div>
