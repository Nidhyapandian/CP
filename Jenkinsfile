pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh'
      }
    } 
       stage('Print Branch Name') {
            steps {
                script {
                    // Define BRANCH_NAME using env.GIT_BRANCH
                    def BRANCH_NAME = env.GIT_BRANCH.split('/').last()
                    echo "Current branch name: ${BRANCH_NAME}"
                }
            }
        }
     stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
        if ["$BRANCH_NAME"="dev"]; then
            ./build.sh
            DOCKER_REPO="smart24/nginximage-dev"
            docker tag myapp:${BUILD_NUMBER} $DOCKER_REPO:${BUILD_NUMBER}
            docker push $DOCKER_REPO:${BUILD_NUMBER}
            docker push $DOCKER_REPO:latest
        elif ["$BRANCH_NAME"="main"]; then
           ./build.sh
            DOCKER_REPO="smart24/nginximage-prod"
            docker tag myapp:${BUILD_NUMBER} $DOCKER_REPO:${BUILD_NUMBER}
            docker push $DOCKER_REPO:${BUILD_NUMBER}
            docker push $DOCKER_REPO:latest
        else echo "Branch not configured for deployment" exit 1
        fi         
    }
   }
  }
}
}
