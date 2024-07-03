pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh'
      }
    } 
  environment {
        // Extracting the branch name from env.GIT_BRANCH
        BRANCH_NAME = env.GIT_BRANCH.split('/').last()
        DOCKER_REPO_DEV = 'dev' // Replace with your dev Docker Hub repository
        DOCKER_REPO_PROD = 'prod' // Replace with your prod Docker Hub repository
    }
     stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
        	sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io" 
                  script {
                    if (BRANCH_NAME == 'dev') {
                        // Build and push to dev repository
                        docker.build("nginximage:latest").push("${DOCKER_REPO_DEV})''\n''
                    } else if (BRANCH_NAME == 'main') {
                        // Build and push to prod repository
                        docker.build("nginximage:latest").push("${DOCKER_REPO_PROD})''\n''
                    } else {
                        echo "Not on a branch that requires Docker image build."
                   }                 
                }
            }
        }
    }
}
}
}  
}
                                                              
