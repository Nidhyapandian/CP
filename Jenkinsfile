

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
          sh "docker tag nginx smart24/nginximg :v1"
          sh 'docker push $DOCKER_BFLASK_IMAGE'
    }
   }
  }
}
}
