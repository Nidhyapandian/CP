#!/bin/bash
 echo "Current branch is: ${BRANCH_NAME}"
if [ "${BRANCH_NAME}" -eq "dev" ]
then

	./build.sh
 	echo "This is dev branch  "
      docker tag nginximage smart24/dev:dev
    echo "Pushing Docker image to Docker Hub..."
    docker push smart24/dev:dev
    
    echo "Docker image pushed successfully."
	

elif [ "${BRANCH_NAME}" -eq "main" ]
then
	./build.sh
 	echo "mainnnnnnn"
  docker tag nginximage smart24/prod:prod
    echo "Pushing Docker image to Docker Hub..."
    docker push smart24/prod:prod
	
else echo "Branch not configured for deployment" exit 1
fi




















             
              
  

                 
    
  
    

  

