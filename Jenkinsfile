pipeline {
  agent any
  
  environment {
    ECR_REPOSITORY_URI = '1234567890.dkr.ecr.us-east-1.amazonaws.com/myrepo'
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
                withAWS(credentials: 'aws-access-key-id', region: 'us-east-1') {
                 sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 248393754086.dkr.ecr.us-east-1.amazonaws.com'
                 sh 'docker tag springappimg:latest $ECR_REPOSITORY_URI:latest'
                 sh 'docker push $ECR_REPOSITORY_URI:latest'
                }
            }
        }    

  }
}
