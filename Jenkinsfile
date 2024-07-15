pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh'
      }
    }
     stage('Branch_Name') {
            steps {
                script {
                    def BRANCH_NAME = env.GIT_BRANCH.split('/').last()
                    echo "Current branch is: ${BRANCH_NAME}"
                       }
                   }
               }
      stage('Deploy') {
        steps {
           withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
             sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"   
             sh 'docker-compose down'
             sh 'chmod +x build.sh'
             sh './build.sh'         
             sh 'docker tag nginximage smart24/dev:v1'
             echo "Pushing Docker image to Docker Hub..."
             sh 'docker push smart24/dev:v1'
             echo "Docker image pushed successfully."
            
            }
          }
         }
        }
      }
   
