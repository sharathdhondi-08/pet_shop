pipeline{
    agent any
    stages {
        stage ('image build') {
            steps {
                sh 'docker build -t image-1:v1 .'
            }
        }
        stage ('deploy to container') {
            steps {
                sh 'docker stop c1 || true'
                sh 'docker rm c1 || true' 
                sh 'docker run -d --name c1 -p 8081:8080 image-1:v1'
            }
        }
    }
}
