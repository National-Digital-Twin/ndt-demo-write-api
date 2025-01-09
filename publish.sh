#!/bin/sh

AWS_REGION=eu-west-2
AWS_ACCOUNT=$(aws sts get-caller-identity --query Account --output text)

aws ecr get-login-password --region $AWS_REGION | sudo docker login --username AWS --password-stdin $AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com
TAG=$(date +%s)

IMAGE=$AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com/iris/write-api:$TAG

sudo docker tag iris/write-api:latest $IMAGE
sudo docker push $IMAGE

echo "Revision tag: $TAG"
