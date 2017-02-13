#!/usr/bin/env bash

# more bash-friendly output for jq
JQ="jq --raw-output --exit-status"

configure_aws_cli(){
  aws --version
  aws configure set default.region ap-northeast-1
  aws configure set default.output json
}

push_ecr_image(){
  eval $(aws ecr get-login --region ap-northeast-1)
  docker push 073861455897.dkr.ecr.ap-northeast-1.amazonaws.com/nodejs-simple-helloworld:$CIRCLE_SHA1
}

make_task_def(){
  task_template='[
    {
      "name": "stacc-stg-service-ecsservice",
      "image": "073861455897.dkr.ecr.ap-northeast-1.amazonaws.com/nodejs-simple-helloworld:%s",
      "essential": true,
      "memory": 995,
      "cpu": 1024,
      "portMappings": [
        {
          "containerPort": 4000,
          "hostPort": 80
        }
      ],
      "command": ["npm","run","serve"]
    }
  ]'

  task_def=$(printf "$task_template" $CIRCLE_SHA1)
}

register_definition() {

  if revision=$(aws ecs register-task-definition --container-definitions "$task_def" --family $family | $JQ '.taskDefinition.taskDefinitionArn'); then
    echo "Revision: $revision"
  else
    echo "Failed to register task definition"
    return 1
  fi

}

deploy_cluster() {

  family="stacc-stg-service-ecsservice"

  make_task_def
  register_definition
  if [[ $(aws ecs update-service --cluster kinkan-stg-server-ecscluster --service service --task-definition $revision | \
                   $JQ '.service.taskDefinition') != $revision ]]; then
    echo "Error updating service."
    return 1
  fi

  echo "Deployed!"
  return 0
}

configure_aws_cli
push_ecr_image
deploy_cluster
