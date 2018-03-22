pipeline {
    agent any
    tools {
        maven '3.5.3'
		docker 'default'
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
				sh 'docker image tag javatest host03:6000/test'
				sh "docker service create --name helloworldjava -p 8888:8888 --constraint 'node.labels.type == worker' java-test-hello"
			}
		}   
	}
}