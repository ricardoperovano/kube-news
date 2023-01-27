pipeline{
    agent any

    stages {

        stage ('Build Docker Image'){
            steps{
                script{
                    dockerapp = docker.build("perovano/kube-news:v${env.BUILD_ID}", "-f ./Dockerfile .")
                }
            }
        }

        stage ('Push Docker Image'){
            steps{
                script{
                    dockerapp = docker.withRegistry("https://registry.hub.docker.com", 'dockerhub'){
                        dockerapp.push('latest')
                        dockerapp.push("v${env.BUILD_ID}")
                    }
                }
            }
        }

        stage ('Deploy Kubernetes'){
            steps{
                withKubeConfig([credentialsId: 'kubeconfig']){
                    sh 'kubectl apply -f ./k8s/deployment.yaml'
                }
            }
        }
    }
}