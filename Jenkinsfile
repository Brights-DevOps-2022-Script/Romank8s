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
                sh 'kubectl version'
                // sh 'kubectl apply -f nginx-namespace.yaml'
                // sh "kubectl apply -f nginx-deployment.yaml"
                // sh "kubectl apply -f nginx-service.yaml"
                // sh "kubectl get pod -n romank8s"
            }
        }
    }
}