pipeline {
    agent { dockerfile true }
    environment { HOME="." }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
                sh "echo $PWD"
                sh "ls"
                sh 'cypress run'
            }
        }
    }
}
