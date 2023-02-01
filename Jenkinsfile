pipeline {
    agent {
        docker {
            image 'devops2022.azurecr.io/alpine-test'
        }
    }
    environment {
        ACRCreds = credentials('acr_creds')
        KUBECONFIG = credentials('k8s_config')
    }
    stages {
        stage("build Nginx") {
            steps {
                sh 'docker login devops2022.azurecr.io -u "$ACRCreds_USR" -p "$ACRCreds_PSW"'
                // sh 'docker build -t devops2022.azurecr.io/nginx:felix-schultes-heureka .'
            }
        }
        stage('Deploy Nginx') {
            steps {
                sh 'echo roman'
                // sh 'kubectl apply -f nginx-namespace.yaml'
                // sh "kubectl apply -f nginx-deployment.yaml"
                // sh "kubectl apply -f nginx-service.yaml"
                // sh "kubectl get pod -n felixheureka"
            }
        }
    }
}