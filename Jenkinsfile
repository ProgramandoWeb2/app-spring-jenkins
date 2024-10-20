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
