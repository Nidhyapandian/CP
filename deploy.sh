#! /bin/bash
# GET CURRENT BRANCH:
def BRANCH_NAME ='${GIT_BRANCH.split/.last()'

if [ "${BRANCH_NAME}" -eq "dev" ]
then

	./build.sh
 	echo "haiiii"
	DOCKER_REPO="smart24/nginximage-dev"

elif [ "${BRANCH_NAME}" -eq "main" ]
then
	./build.sh
 	echo "mainnnnnnn"
	DOCKER_REPO ="smart24/ngincimage-prod"
	
else echo "Branch not configured for deployment" exit 1
fi
  
docker tag myapp:${BUILD_NUMBER} $DOCKER_REPO:${BUILD_NUMBER}
docker push $DOCKER_REPO:${BUILD_NUMBER}
docker push $DOCKER_REPO:latest

    
  
    

  




             
              
  

                 
    
  
    

  

