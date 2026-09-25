pipeline {
    agent any
    stages {
        stage(git) {
            steps {
                git branch: 'main', url: 'https://github.com/sharathdhondi-08/pet_shop.git'
            }
        }
        stage(build) {
            steps {
                sh 'mvn clean package'
            }
        }
        stage(deploy) {
            steps {
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'dcedef17-c56b-418b-90ca-65aa4ede67d1', path: '', url: 'http://54.197.37.110:8085/')], contextPath: 'petshop', war: 'target/*.war'
            }
        }
    }
}
