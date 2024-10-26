# Ejecutamos jenkins con docker
docker run -d --name jenkins-test -u root -p 8090:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:alpine-jdk21

# Actualizamos APK
apk update
# Agregamos docker a nuestro contenedor
apk add docker
# Ejecutamos docker
docker exec -it jenkins /bin/bash
# Validamos que docker esté creado.
docker --version

#Pipeline
pipeline {
    agent any
    tools{
        maven 'Maven 3.9.9'
    }

    environment{
        IMAGE_NAME = 'docker-jenkins-test'
    }

    stages {
        stage('Checkout'){
            steps {
                git url: 'https://github.com/ProgramandoWeb2/app-spring-jenkins.git',
                branch: 'main'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn clean package -DskipTest'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image using Dockerfile in the root directory
                    sh "docker build -t ${IMAGE_NAME}:1.0 ."
                }
            }
        }
    }
    post{
        success {
            echo 'Pipeline ejecutado correctamente'
        }
        failure {
            echo 'Pipeline failed!'
        }

    }
}