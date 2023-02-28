pipeline {
  agent any

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
