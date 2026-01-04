pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/vb954000-cyber/DEVOPS-PROJECT-1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-app:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker rm -f devops-container || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run -d -p 3000:3000 --name devops-container devops-app:latest
                '''
            }
        }
    }

    post {
        success {
            echo '🚀 App Deployed Successfully'
        }
        failure {
            echo '❌ Deployment Failed'
        }
    }
}
