pipeline{
    agent {
        label 'worker-2'
    }
    stages {
        stage ('image build') {
            steps {
                sh 'sudo docker build -t image-1:v1 .'
            }
        }
        stage ('deploy to container') {
            steps {
                sh 'sudo docker stop c1 || true'
                sh 'sudo docker rm c1 || true' 
                sh 'sudo docker run -d --name c1 -p 8081:8080 image-1:v1'
            }
        }
    }
}
