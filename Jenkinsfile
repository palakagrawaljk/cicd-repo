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
				sh 'sudo mkdir -p /code/addressbook/$BUILD_NUMBER'
				sh 'sudo cp /var/lib/jenkins/workspace/addressbook/target/addressbook.war /code/addressbook/$BUILD_NUMBER/'
				sh 'sudo cp /var/lib/jenkins/workspace/addressbook/Dockerfile /code/addressbook/$BUILD_NUMBER'
				sh 'sudo docker build -f /code/addressbook/$BUILD_NUMBER/Dockerfile -t iamdevopstrainer/abapp-20210930:$BUILD_NUMBER /code/addressbook/$BUILD_NUMBER'
			}
		}

		stage('Push Docker Image')
		{
			steps
			{
				sh "sudo docker push iamdevopstrainer/abapp-20210930:$BUILD_NUMBER"
			}
		}

		stage('Update Application')
		{
			steps
			{
				sh "sudo kubectl set image deployment.apps/addressbook-dep addressbook-cont=iamdevopstrainer/abapp-20210930:$BUILD_NUMBER --record=true"
			}
		}
		
	}
		
}
