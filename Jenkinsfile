pipeline {
    agent {
        label 'worker-1'
    }
    stages {
        stage ('git') {
            steps{
                git branch: 'main', url: 'https://github.com/sharathdhondi-08/pet_shop.git'
            }
        }
        stage ('maven') {
            steps{
                sh 'mvn clean package'
            }
        }
        stage ('sonar') {
            steps{
                withSonarQubeEnv('sonar-1') {
                    sh 'mvn verify sonar:sonar'
                }
            }
        }
        stage ('deploy') {
            steps{
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'greatcoder', path: '', url: 'http://35.154.14.236:8080/')], contextPath: 'petshop', war: 'target/*.war'
            }
        }
    }
        post{
            success {
                emailext(
                    to: 'sharathdhondi@gmail',
                    subject: 'build success',
                    body: 'sucess build')
            }
            failure {
                emailext(
                    to: 'sharathdhondi@gmail.com',
                    subject: 'build fail',
                    body: 'build fail'
                    )
            }
        }
}
