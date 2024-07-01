#!/bin/bash

# Check if the branch is dev
if [ "$GIT_BRANCH" = "dev" ]; then
    # Docker build and push
    echo "Building Docker image..."
    docker build -t smart24/dev:dev .
    docker tag nginximage smart24/dev:dev
    echo "Pushing Docker image to Docker Hub..."
    docker push smart24/dev:dev
    
    echo "Docker image pushed successfully."
    
elif [ "$GIT_BRANCH" = "main" ]; then
    # Docker build and push
    echo "Building Docker image..."
    docker build -t smart24/prod:prod .
    docker tag nginximage smart24/prod:prod
    echo "Pushing Docker image to Docker Hub..."
    docker push smart24/prod:prod
    
    echo "Docker image pushed successfully."
else
    echo "Skipping Docker build and push."
fi


















#! /bin/bash
# GET CURRENT BRANCH:
BRANCH_NAME =${BRANCH_NAME:-$( 'env.GIT_BRANCH.split('/').last()')}

if [[ "${BRANCH_NAME}" == "dev" ]]; then
	./build.sh
	DOCKER_REPO="smart24/myapp-dev"
	docker tag myapp:${BUILD_NUMBER} $DOCKER_REPO:${BUILD_NUMBER}
	docker push $DOCKER_REPO:${BUILD_NUMBER}
	docker push $DOCKER_REPO:latest
elif [[ "${BRANCH_NAME}" == "main" ]]; then
	./build.sh
	DOCKER_REPO ="smart24/myapp-prod"
	docker tag myapp:${BUILD_NUMBER} $DOCKER_REPO:${BUILD_NUMBER}
	docker push $DOCKER_REPO:${BUILD_NUMBER}
	docker push $DOCKER_REPO:latest
else echo "Branch not configured for deployment" exit 1
fi
  


    
  
    

  




             
              
  

                 
    
  
    

  

