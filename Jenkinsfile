pipeline {
  agent any

  stages {
    /* stage('Checkout') {
      steps {
        // Checkout the source code from GitHub
        git 'https://github.com/mohamed1199/spring-app.git'
      }
    } */

    stage('Build') {
      steps {
        // Build the project with Gradle
        sh './gradlew build'
      }
    }

    stage('Test') {
      steps {
        // Run unit tests with Gradle
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
}
