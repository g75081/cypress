pipeline {
    agent { dockerfile true }
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
