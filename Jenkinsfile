pipeline {
  agent any
  stages {
        stage('build') {
           steps {
           echo 'Hello'
           sh 'docker build -t app:test .'
          
           }
            post{ 
            always{
            echo "esto siempre saldra "
            }
            failure{
            echo "fallo"

            }
            success{
            echo "paso"
            }
        }
       
        
        }
        stage('test') {
            steps {
            echo 'Hello2' 
            sh '/bin/nc -vz localhost 22' 
            sh '/bin/nc -vz localhost 80' 
            }
        }

        stage('Push Eegistry') {
            steps {
            echo 'Hello3'   
            sh 'docker tag app:test app:stable'
            sh 'docker push app:test app:stable'
            }
            
          post{
            always{
            cleanWS()
            }
        }   
        }
       
    }
}
