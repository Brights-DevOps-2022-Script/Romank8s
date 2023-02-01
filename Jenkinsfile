pipeline {
    agent {
        docker {
            // image 'devops2022.azurecr.io/alpine-simon'
            args '-v /var/run/docker.sock:/var/run/docker.sock --privileged'
        }
    }
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

        stage('notBuild') {
            steps {
                sh "docker build -t devops2022.azurecr.io/nginx:roman98 ."
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