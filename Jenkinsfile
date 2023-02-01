pipeline {
    agent any
    
    environment {
    KUBECONFIG = credentials('k8s_config')
    ACRCreds = credentials('acr_creds')
    }
    stages {
        
        stage('test') {
            steps {
                sh 'docker login devops2022.azurecr.io -u "$ACRCreds_USW" -p "$ACRCreds_PSW"'
            }
        }

        stage('build') {
            agent {
                docker{
                    image 'gcr.io/cloud-builder/kubectl'
                }
            }
        }

        stage('notDeploy') {
            steps {
                sh "docker --version"
                sh "kubectl version --short"
            }
        }
    }
}