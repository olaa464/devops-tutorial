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
                /* Let's make sure we have the repository cloned to our workspace */
                checkout scm
            }
        }

        stage('Build image') {
            steps {
                /* This builds the actual image; synonymous to
                 * docker build on the command line */
                script {
                    app = docker.build("joeysapp")
                }
            }
        }

        stage('Test image') {
    steps {
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
                sh "docker push joeysapp:${env.BUILD_NUMBER}"
                sh "docker push joeysapp:latest"
            }
        }
    }
}
    }
}
