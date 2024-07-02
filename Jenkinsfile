
def BRANCH_NAME

pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh'
      }
    } 
       stage('Get Branch Name') {
            steps {
                script {
                    BRANCH_NAME = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                }
            }
        }
    }
      
    post {
        always {
            echo "Branch Name: ${BRANCH_NAME}"
        }
    }
}

