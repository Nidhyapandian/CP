#! /bin/bash
# GET CURRENT BRANCH:
def BRANCH_NAME = env.GIT_BRANCH.split('/').last()

BRANCH_NAME = $(git rev-parse --abbrev -ref HEAD)


<<<<<<< HEAD
if ["$BRANCH_NAME" = "dev"]; then
=======
if [[ "${BRANCH_NAME}" == "dev" ]]; then
>>>>>>> main
	./build.sh
	DOCKER_REPO ="smart24/myapp-dev"

<<<<<<< HEAD
elif ["$BRANCH_NAME" = "prod"]; then
=======
elif [[ "${BRANCH_NAME}" == "main" ]]; then
>>>>>>> main
	./build.sh
	DOCKER_REPO ="smart24/myapp-prod"
	
else echo "Branch not configured for deployment" exit 1
fi
  
docker tag myapp:${BUILD_NUMBER} $DOCKER_REPO:${BUILD_NUMBER}
docker push $DOCKER_REPO:${BUILD_NUMBER}
docker push $DOCKER_REPO:latest

    
  
    

  




             
              
  

                 
    
  
    

  

