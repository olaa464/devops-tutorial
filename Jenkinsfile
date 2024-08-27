pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:$PATH"
    }

    stages {

        stage('Check Docker') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Clone repository') {
            steps {
                /* Clone the repository to the workspace */
                checkout scm
            }
        }

        stage('Build image') {
            steps {
                /* Build the Docker image and tag it as 'latest' */
                script {
                    app = docker.build("joeybader/joeysapp:latest")
                }
            }
        }

        stage('Test image') {
            steps {
                /* Dummy test stage */
                script {
                    echo 'tests passed'
                }
            }
        }

        stage('Push image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_HUB_USR', passwordVariable: 'DOCKER_HUB_PSW')]) {
                        sh "echo $DOCKER_HUB_PSW | docker login -u $DOCKER_HUB_USR --password-stdin"
                        sh "docker push joeybader/joeysapp:latest"
                    }
                }
            }
        }
    }
}
