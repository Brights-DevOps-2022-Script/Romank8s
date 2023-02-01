pipeline {
    agent {
        docker {
            image 'devops2022.azurecr.io/alpine-simon'
            args '-v /var/run/docker.sock:/var/run/docker.sock --privileged'
        }
    }
    environment {
    KUBECONFIG = credentials('k8s_config')
    }
    stages {
        
        stage('test') {
            steps {
                sh "docker --version"
                sh "kubectl version --short"
            }
        }

        stage('notBuild') {
            steps {
                sh "docker --version"
                sh "kubectl version --short"
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