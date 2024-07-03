#!/bin/bash

# Check if the branch is dev
if [ "$GIT_BRANCH" == "dev" ]; then
    ./build.sh
    docker tag nginximage smart24/dev:dev
    echo "Pushing Docker image to Docker Hub..."
    docker push smart24/dev:dev
    
    echo "Docker image pushed successfully."
    
elif [ "$GIT_BRANCH" == "main" ]; then
    ./build.sh   
    docker tag nginximage smart24/prod:prod
    echo "Pushing Docker image to Docker Hub..."
    docker push smart24/prod:prod
    
    echo "Docker image pushed successfully."
else
    echo "Skipping Docker build and push."
fi



















             
              
  

                 
    
  
    

  

