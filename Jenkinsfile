pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "chsks2004/chsks2004:latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the static website code from Git
                git 'https://github.com/Sahithchaganti2004/finalFSI.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    // Run the Docker container locally (or specify server details if deploying remotely)
                    docker.image(DOCKER_IMAGE).run('-p 80:80')
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
