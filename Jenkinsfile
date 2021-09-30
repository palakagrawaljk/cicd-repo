pipeline
{
	agent any
	stages
	{
		stage('Checkout')
		{
			steps
			{
				git 'https://github.com/iamdevopstrainer/DevOpsClassCodes'
			}
		}
		
		stage('Compile')
		{
			steps
			{
				sh 'mvn compile'
			}
		}

		stage('Test')
		{
			steps
			{
				sh 'mvn test'
			}
		}

		stage('Build')
		{
			steps
			{
				sh 'mvn package'
			}
		}
		
		stage('Build Docker Image')
		{
			steps
			{
				sh "sudo mkdir -p /code/${env.PROJECT_NAME}/${env.BUILD_NUMBER}"
				sh "sudo cp /var/lib/jenkins/workspace/${env.PROJECT_NAME}/target/addressbook.war /code/${env.PROJECT_NAME}/${env.BUILD_NUMBER}/"
				sh "sudo cp /var/lib/jenkins/workspace/${env.PROJECT_NAME}/Dockerfile /code/${env.PROJECT_NAME}/${env.BUILD_NUMBER}/"
				sh "sudo docker build -f /code/${env.PROJECT_NAME}/${env.BUILD_NUMBER}/Dockerfile -t iamdevopstrainer/ab-30Sep2021:${env.BUILD_NUMBER} /code/${env.PROJECT_NAME}/${env.BUILD_NUMBER}"
			}
		}

		stage('Push Docker Image')
		{
			steps
			{
				sh "sudo docker push iamdevopstrainer/ab-30Sep2021:$BUILD_NUMBER"
			}
		}

		stage('Update Application')
		{
			steps
			{
				sh "sudo docker run -itd -P iamdevopstrainer/ab-30Sep2021:$BUILD_NUMBER"
			}
		}
		
	}
		
}
