
### How to set environment variables in circle ci ?

  - https://circleci.com/docs/environment-variables/

### How to Using Yarn (the npm replacement) on CircleCI

  - https://circleci.com/docs/yarn/

### How to Using Nodejs

  - https://circleci.com/docs/language-nodejs/

### How to use mongodb

  - https://discuss.circleci.com/t/using-mongodb-3-0/527/3

### How to deploy code to ECR

  - https://github.com/circleci/go-ecs-ecr
  - https://github.com/circleci/circle-ecs

### How to cache docker layers

  - https://circleci.com/docs/docker/#caching-docker-layers

### How to update ECS

  - https://gist.github.com/zacharyclaysmith/6691bcd8ed2fb73db77a
  - https://github.com/circleci/go-ecs-ecr/blob/master/deploy.sh
  - https://github.com/circleci/circle-ecs/blob/master/deploy.sh
  - https://github.com/circleci/go-ecs-ecr/blob/master/deploy.sh
  - https://circleci.com/docs/continuous-deployment-with-aws-ec2-container-service/
  - https://circleci.com/blog/circleci-aws-ecrecs/
  - http://www.savvyclutch.com/continuous-deployment-to-aws-ecs-and-circle-ci/

### Build local

```
docker build --file ./Dockerfile -t nodejs-simple-helloworld .
docker run -d nodejs-simple-helloworld tail -f /dev/null
```
