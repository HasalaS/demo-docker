pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-hub-login')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/HasalaS/demo-docker.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t hasi/sb-docker:latest .'
                echo "Docker Image Tag Name:${dockerImageTag}"
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push hasi/sb-docker:latest'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
