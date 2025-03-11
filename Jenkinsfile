pipeline {
	agent any

	stages {
		stage('Checkout'){
			steps {
			checkout scm
			}
		}

		stage('Permissions') {
			steps {
			sh 'chmod +x apache.sh'
			}
		}

		stage('Deploy apache') {
			steps {
			sh './apache.sh'
			}
		}

        stage('Verify') {
            steps {
                sh 'curl -s http://localhost | grep "<!DOCTYPE html>"'
            }
        }
	}

    post {
        success {
            echo 'Apache deployment successful!'
        }
        failure {
            echo 'Apache deployment failed!'
        }
    }
}
