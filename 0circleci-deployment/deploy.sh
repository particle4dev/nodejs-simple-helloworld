#!/usr/bin/env bash
VERSION=$1
configure_aws_cli(){
  aws --version
  aws configure set default.region ap-northeast-1
  aws configure set default.output json
}

push_ecr_image(){
  eval $(aws ecr get-login --region ap-northeast-1)
  docker push 073861455897.dkr.ecr.ap-northeast-1.amazonaws.com/nodejs-simple-helloworld:$VERSION
}

configure_aws_cli
push_ecr_image
