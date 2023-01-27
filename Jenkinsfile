pipeline{
    agent any

    stages {

        stage ('Build Docker Image'){
            steps{
                script{
                    dockerapp = docker.build("perovano/kube-news:${env.BUILD_ID}", "-f ./Dockerfile .")
                }
            }
        }

        stage ('Push Docker Image'){
            steps{
                script{
                    dockerapp = docker.withRegistry("https://registry.hub.docker.com", 'dockerhub'){
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
    }
}