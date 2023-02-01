pipeline {
    agent {
        docker {
            image 'alpine/k8s:1.23.16'
        }
    }
    environment {
        ACRCreds = credentials('acr_creds')
        KUBECONFIG = credentials('k8s_config')
    }
    stages {
        //stage("build Nginx") {
        //    steps {
        //}
        stage('Deploy Nginx') {
            steps {
                sh 'kubectl apply -f rmnspace.yml'   
                sh "kubectl apply -f rmndeployment.yml"
                sh "kubectl apply -f rmnservice.yml"
                sh "kubectl get pod -n romank8s"
            }
        }
    }
}