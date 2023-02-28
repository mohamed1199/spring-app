pipeline {
  agent any

    stage('Checkout') {
      steps {
        git 'https://github.com/mohamed1199/spring-app.git'
      }
    }
    stage('Build') {
      steps {
        sh './gradlew build'
      }
    }

    stage('Test') {
      steps {
        // Run unit tests with Gradle ok
        sh './gradlew test'
      }
    }

    stage('Package') {
      steps {
        // Package the application into a JAR file
        sh './gradlew bootJar'
      }
    }
  }
