

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
    }

      
    post {
        always {
            echo "Branch Name is : ${BRANCH_NAME}"
            sh 'docker stop web'
            sh 'docker rm web'
            sh 'docker-compose up -d'
        }
    }
}

