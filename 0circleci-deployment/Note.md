```
Build, tag, and push Docker image
Now that your repository exists, you can push a Docker image by following these steps:
Successfully created repository
073861455897.dkr.ecr.ap-northeast-1.amazonaws.com/nodejs-simple-helloworld
To install the AWS CLI and Docker and for more information on the steps below, visit the ECR documentation page.
1) Retrieve the docker login command that you can use to authenticate your Docker client to your registry:

aws ecr get-login --region ap-northeast-1

2) Run the docker login command that was returned in the previous step.
3) Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here. You can skip this step if your image is already built:

docker build -t nodejs-simple-helloworld .

4) After the build completes, tag your image so you can push the image to this repository:

docker tag nodejs-simple-helloworld:latest 073861455897.dkr.ecr.ap-northeast-1.amazonaws.com/nodejs-simple-helloworld:latest

5) Run the following command to push this image to your newly created AWS repository:

docker push 073861455897.dkr.ecr.ap-northeast-1.amazonaws.com/nodejs-simple-helloworld:latest
```
