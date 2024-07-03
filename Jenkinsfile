pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh'
      }
    } 
  }
  
     stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
        	sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io" 
                script {
                    // Extract branch name from GIT_BRANCH environment variable
                    def branchName = env.GIT_BRANCH.split('/').last()

                    // Determine which Docker repository to use based on branchName
                    def dockerRepo
                    switch (branchName) {
                        case 'dev':
                            dockerRepo = DEV_DOCKER_REPO
                            break
                        case 'main':
                            dockerRepo = PROD_DOCKER_REPO
                            break
                        default:
                            echo "Branch '${branchName}' is not configured for deployment"
                            return // Exit the script if branch is not dev or main
                    }

                    // Replace 'docker build' with your actual build step
                    sh './build.sh'

                    // Tag and push Docker image
                    docker.withRegistry('', '') {
                        def customImage = docker.build("myapp:${BUILD_NUMBER}")
                        customImage.push("${dockerRepo}:${BUILD_NUMBER}")
                        customImage.push("${dockerRepo}:latest")
                    }
                }
            }
        }
    }
}

   
