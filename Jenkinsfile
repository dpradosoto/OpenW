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
            sh 'docker run --rm --name app -id -d -p 80:80 app:test' 
            sh 'nc -vz localhost 80' 
            }
            post{
                always{
                    sh 'docker container stop app'
                }
            }
        }

        stage('Push Registry') {
            steps {
            echo 'Hello3'   
            withCredentials([usernamePassword(credentialsId: 'dpsDH', passwordVariable: 'pass', usernameVariable: 'user')]) {
                sh 'docker login -u=$user -p=$pass && docker tag app:test dpradosoto/app:stable'
                sh 'docker push dpradosoto/app:stable'
            }
            
            }
            
         
        }
       
    }
}
