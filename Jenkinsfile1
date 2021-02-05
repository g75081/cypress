pipeline {
    agent {
      dockerfile {
        filename 'Dockerfile'
        args "-v $PWD:/e2e -w /e2e --name cypress.3.2.0 cypress:3.2.0"
      }
    }
    environment { HOME="." }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
                sh "echo $PWD"
                sh "ls"
                git 'https://github.com/g75081/cypress.git'
                sh 'cypress run'
            }
        }
    }
}
