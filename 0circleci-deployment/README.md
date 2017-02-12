
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

### Build local

```
docker build --file ./Dockerfile -t nodejs-simple-helloworld .
docker run -d nodejs-simple-helloworld tail -f /dev/null
```
