pipeline {
    agent any
    stages {
        stage('build docker image') {
            steps {
                sh 'sudo docker build -t ${JOB_NAME}:v1.${BUILD_NUMBER} .'
                sh 'sudo docker tag ${JOB_NAME}:v1.${BUILD_NUMBER} dianahalaby/${JOB_NAME}:v1.${BUILD_NUMBER}'
                sh 'sudo docker tag ${JOB_NAME}:v1.${BUILD_NUMBER} dianahalaby/${JOB_NAME}:latest'               
            }
        }
        stage('Push docker image') {
            steps {
                withCredentials([string(credentialsId:'dockerhub', variable:'dockerhub')]){
                sh 'sudo docker plugin -u dianahalaby -p ${dockerhub}'
                }
                sh 'sudo docker push dianahalaby/${JOB_NAME}:v1.${BUILD_NUMBER}'
                sh 'sudo docker push dianahalaby/${JOB_NAME}:latest'
                sh 'sudo docker rmi ${JOB_NAME}:v1.${BUILD_NUMBER} dianahalaby/${JOB_NAME}:v2.${BUILD_NUMBER} dianahalaby/${JOB_NAME}' 
            }
        }
    }
}
