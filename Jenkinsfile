pipeline {
  agent any
  
  environment {
    AWS_ACCESS_KEY_ID = credentials('AKIAWKBYFO27JLX5KXOT')
    AWS_SECRET_ACCESS_KEY = credentials('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')
    AWS_DEFAULT_REGION = 'us-east-1'
    ECR_REPOSITORY_URI = '248393754086.dkr.ecr.us-east-1.amazonaws.com/myrepo'
  }

  stages {
    
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

    stage('Docker Build') {
      steps {
      	sh 'docker build -t springappimg:latest .'
      }
    }
    
    stage('Push to ECR') {
      steps {
        withAWS(credentials: ['aws-access-key-id', 'aws-secret-access-key', 'aws-default-region']) {
          sh '$(aws ecr get-login --no-include-email)'
          sh "docker tag springappimg $ECR_REPOSITORY_URI:latest"
          sh "docker push $ECR_REPOSITORY_URI:latest"
        }
      }
    }

  }
}
