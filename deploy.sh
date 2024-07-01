#! /bin/bash
# GET CURRENT BRANCH:
BRANCH_NAME =${BRANCH_NAME:-$( 'env.GIT_BRANCH.split('/').last()')}

if [[ "${BRANCH_NAME}" == "dev" ]]; then
	./build.sh
	DOCKER_REPO="smart24/myapp-dev"

elif [[ "${BRANCH_NAME}" == "main" ]]; then
	./build.sh
	DOCKER_REPO ="smart24/myapp-prod"
	
else echo "Branch not configured for deployment" exit 1
fi
  
docker tag myapp:${BUILD_NUMBER} $DOCKER_REPO:${BUILD_NUMBER}
docker push $DOCKER_REPO:${BUILD_NUMBER}
docker push $DOCKER_REPO:latest

    
  
    

  




             
              
  

                 
    
  
    

  

