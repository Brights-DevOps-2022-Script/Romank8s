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
        stage('Image Build') {
            agent {
                docker {
                    sh 'docker build -t devops2022.azurecr.io/romanm:test1'
                    sh 'docker push devops2022.azurecr.io/romanm:test1'

                }
            }
            environment{
                 KUB_CONF = credentials('k8s_config')
            }
            steps{
                //sh 'kubectl --kubeconfig=$KUB_CONF delete namespace pierre-space-second'
                //sh 'kubectl --kubeconfig=$KUB_CONF create namespace pierre-space-second'
                sh 'echo $KUB_CONF'
                sh 'kubectl --kubeconfig=$KUB_CONF apply -f rmndeployment.yml -n romank8s'
                sh 'kubectl --kubeconfig=$KUB_CONF get namespaces'                
            }    
        }
    }   
}
