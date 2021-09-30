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
				sh 'sudo mkdir -p /code/ppjob1/$BUILD_NUMBER'
				sh 'sudo cp /var/lib/jenkins/workspace/ppjob1/target/addressbook.war /code/ppjob1/$BUILD_NUMBER/'
				sh 'sudo cp /var/lib/jenkins/workspace/ppjob1/Dockerfile /code/ppjob1/$BUILD_NUMBER'
				sh 'sudo docker build -f /code/ppjob1/$BUILD_NUMBER/Dockerfile -t iamdevopstrainer/ab-20210930:$BUILD_NUMBER /code/ppjob1/$BUILD_NUMBER'
			}
		}

		stage('Push Docker Image')
		{
			steps
			{
				sh "sudo docker push iamdevopstrainer/ab-20210930:$BUILD_NUMBER"
			}
		}

		stage('Update Application')
		{
			steps
			{
				sh "sudo kubectl set image deployment.apps/addressbook-dep addressbook-cont=iamdevopstrainer/ab-20210930:$BUILD_NUMBER --record=true"
			}
		}
		
	}
		
}
