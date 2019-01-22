pipeline {
    agent any

    environment {
      MAVEN_IMAGE = 'maven:3.5-jdk-8'
    }
    stages {

         stage('Test') {
            steps {
               script {
                  docker.image(MAVEN_IMAGE).inside('-v /home/yann/.m2:/root/.m2 -v /home/yann/.m2/settings.xml:/root/.m2/settings.xml') {
                      sh 'mvn test'
                   }
               }

            }

         }

         stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
          }

          stage('Publish docker image') {
            /*when {
              branch 'master'
            }*/
            steps {
              script {
                def app = docker.build("slonepi/demo", ".")
              }

              withDockerRegistry([ credentialsId: "dockerhub-credentials", url: "" ]) {
                sh 'docker push slonepi/demo:latest'
              }
            }
          }
    }
}
