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
		stage('Docker image run') {
			steps{
				sh 'docker build -t java-test-hello .'
				sh "docker service create --name helloworldjava -p 8888:8888 --constraint 'node.labels.type == worker' java-test-hello"
			}
		}   
	}
}