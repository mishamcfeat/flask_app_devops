pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t flask_app:latest .'
            }
        }
        stage('Test') {
            steps {
                script {
                    def app = docker.build("flask_app")
                    app.inside {
                        sh 'curl -s http://localhost:5000 | grep "Hello, World!"'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 5000:5000 --name flask_app flask_app:latest'
            }
        }
    }
}
