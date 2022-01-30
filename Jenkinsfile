pipeline
{
	agent any
	stages
	{
		stage('Checkout')
		{
			steps
			{
				git 'https://github.com/edureka-devops/projCert'
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
				sh 'mkdir -p /code/web/$BUILD_NUMBER'
				sh 'sudo cp /var/lib/jenkins/workspace/web/target/website.war /code/web/$BUILD_NUMBER/'
				sh 'sudo cp /var/lib/jenkins/workspace/web/Dockerfile /code/web/$BUILD_NUMBER/'
				sh 'sudo docker build -f /code/web/$BUILD_NUMBER/Dockerfile -t palakagrawal25/ab-30jan2022:$BUILD_NUMBER /code/web/$BUILD_NUMBER'
			}
		}

		stage('Push Docker Image')
		{
			steps
			{
				sh 'sudo docker push palakagrawal25/ab-30jan2022:$BUILD_NUMBER'
			}
		}

		stage('Update Application')
		{
			steps
			{
				sh 'sudo docker run -itd -P palakagrawal25/ab-30jan2022:$BUILD_NUMBER'
			}
		}
		
	}
		
}
