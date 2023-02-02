pipeline {
    agent any 
    environment{
        ACR_CRED = credentials('acr_creds')
    }
    stages {
        stage('ACR Login') {
            steps{
                sh 'docker login devops2022.azurecr.io -u $ACR_CRED_USR -p $ACR_CRED_PSW'
            }
        }
        stage('Image Building') {
            steps {
                sh 'docker build -t devops2022.azurecr.io/romanm:test6 .'
                sh 'docker push devops2022.azurecr.io/romanm:test6'
                sh 'docker rmi devops2022.azurecr.io/romanm:test6'
            }
        }
        stage('Deploy') {
            agent {
                docker {
                    image 'alpine/k8s:1.23.16'
                }
            }
            environment{
                 KUB_CONF = credentials('k8s_config')
            }
            steps{
                sh 'kubectl --kubeconfig=$KUB_CONF delete namespace romank8s'
                sh 'kubectl --kubeconfig=$KUB_CONF create namespace romank8s'
                sh 'echo $KUB_CONF'
                sh 'kubectl --kubeconfig=$KUB_CONF apply -f rmnspace.yml -n romank8s'
                sh 'kubectl --kubeconfig=$KUB_CONF apply -f rmndeployment.yml -n romank8s'
                // sh 'kubectl --kubeconfig=$KUB_CONF get namespaces'   
                sh 'kubectl --kubeconfig=$KUB_CONF set image -n romank8s deployment/romank8s nginx=devops2022.azurecr.io/romanm:test6'             
            }    
        }
    }   
}