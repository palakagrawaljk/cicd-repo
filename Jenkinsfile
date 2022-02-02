pipeline
{
	agent any
	stages
	{
		stage('Checkout')
		{
			steps
			{
				git 'https://github.com/palakagrawaljk/projCert'
			}
		}
		
		
		
		stage('Build Docker Image')
		{
			steps
			{
				sh 'sudo mkdir -p /code/web/$BUILD_NUMBER'
				sh 'sudo cp -r /var/lib/jenkins/workspace/web/ /code/web/$BUILD_NUMBER/'
				sh 'sudo cp /var/lib/jenkins/workspace/web/website/Dockerfile /code/web/$BUILD_NUMBER/'
				sh 'sudo docker build -f /code/web/$BUILD_NUMBER/Dockerfile -t palakagrawal25/php:$BUILD_NUMBER /code/web/$BUILD_NUMBER'
			}
		}

		stage('Push Docker Image')
		{
			steps
			{
				sh 'sudo docker push palakagrawal25/php:$BUILD_NUMBER'
			}
		}

		stage('Update Application')
		{
			steps
			{
				sh 'sudo docker run -itd -P palakagrawal25/php:$BUILD_NUMBER -p 80:80 --name docker-php-apache'
			}
		}
		
	}
		
}
