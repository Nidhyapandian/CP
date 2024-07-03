pipeline {
  agent any
    environment {
       		def BRANCH_NAME = env.GIT_BRANCH.split('/').last()
        	    }
stages{
     stage('Build') {
	 
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
        	sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io" 
		script {
                     
			  if ( "${BRANCH_NAME}" == "dev" ) {
                             sh'chmod +x build.sh'
	                     sh' ./build.sh'
	                      DOCKER_REPO="smart24/nginximage-dev"
                	      docker.image("nginximage:${BUILD_NUMBER}").tag("${DOCKER_REPO}:${BUILD_NUMBER}")
                              docker.image("${DOCKER_REPO}:${BUILD_NUMBER}").push()
                              docker.image("${DOCKER_REPO}:latest").push() }

                  else if ( "${BRANCH_NAME}" == "main" ) {
                          sh'chmod +x build.sh'
	                        sh'./build.sh'
	                        DOCKER_REPO ="smart24/nginximage-prod"
	                        docker.image("nginximage:${BUILD_NUMBER}").tag("${DOCKER_REPO}:${BUILD_NUMBER}")
			  	docker.image("${DOCKER_REPO}:${BUILD_NUMBER}").push()
				docker.image("${DOCKER_REPO}:latest").push()                          
		  }   	
                  else {
			  echo "Branch not configured for deployment" exit 1
		  } 
                  fi
		    stage('Deploy') {
      			steps {
      				sh 'chmod +x build.sh'
        			sh './build.sh'
			      }
    			} 

                   }                 
                }
            }
        }
    }
}

                                                              
