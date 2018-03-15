pipeline {
    agent any
    tools {
        maven '3.5.3'
    }
	stages {
        stage('Build'){
			steps {
				echo 'Run build step like "mvn clean install"'
				sh 'mvn clean install'
			}
        }
		stage('QA'){
			steps {
				echo 'Run test "mvn test"'
				sh 'mvn test'
			}
		}
        stage('SonarQube analysis') {
            steps{
                sh 'mvn sonar:sonar -Dsonar.host.url=http://192.168.11.13:9000/'
                
            }
        }   
	}
}