pipeline {
    agent any
    stages {
        stage('build docker image') {
            steps {
                sh 'sudo docker build -t ${JOB_NAME}:v1.${BUILD_NUMBER} .'
                sh 'sudo docker tag ${JOB_NAME}:v1.${BUILD_NUMBER} dianahalaby/${JOB_NAME}: v1.${BUILD_NUMBER}'
                sh 'sudo docker tag ${JOB_NAME}:v1.${BUILD_NUMBER} dianahalaby/${JOB_NAME}: latest'               
            }
        }stage('run') {
             steps {
                 sh 'docker run --name app -p 80:80 -d dianahalaby/${JOB_NAME}:v1.${BUILD_NUMBER}'
      }
    }
        stage('test') {
            steps {
                sh 'curl 18.209.22.221:80 '
      }
    }
        stage('Push docker image') {
            steps {
                withCredentials([string(credentialsId:'dockerhubpwd', variable:'dockerhubpwd')]){
                sh 'sudo docker plugin -u dianahalaby -p ${dockerhubpwd}'
                }
                sh 'sudo docker push dianahalaby/${JOB_NAME}:v1.${BUILD_NUMBER} .'
                sh 'sudo docker push dianahalaby/${JOB_NAME}:latest'
                sh 'sudo docker rmi ${JOB_NAME}:v1.${BUILD_NUMBER} dianahalaby/${JOB_NAME}:v2.${BUILD_NUMBER} dianahalaby/${JOB_NAME}' 
            }
        }
    }
}

