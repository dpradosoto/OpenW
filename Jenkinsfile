pipeline {
  agent any
  stages {
        stage('build') {
           steps {
           echo 'Hello'
           sh 'doker build -y app .'
          
           }
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
        stage('test2') {
            steps {
            echo 'Hello2'  
            
            }
        }

        stage('test3') {
            steps {
            echo 'Hello3'   
            
            }
            
        }
        post{
            always{
            cleanWS
            }
        }
    }
}
