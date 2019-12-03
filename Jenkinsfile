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
                login_url = "https://id.docker.com/login/?next=%2Fid%2Foauth%2Fauthorize%2F%3Fclient_id%3D43f17c5f-9ba4-4f13-853d-9d0074e349a7%26next%3D%252F%253Fref%253Dlogin%26nonce%3DeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiI0M2YxN2M1Zi05YmE0LTRmMTMtODUzZC05ZDAwNzRlMzQ5YTciLCJleHAiOjE1NzUzOTc0MTMsImlhdCI6MTU3NTM5NzExMywicmZwIjoia2h0NWFIZUZlV1lJYlZDS0gzd3hkUT09IiwidGFyZ2V0X2xpbmtfdXJpIjoiLz9yZWY9bG9naW4ifQ.5ijaQMhY7y0E0Q7CvdA1vNtwEETqcvCTz4wF2UgzTGQ%26redirect_uri%3Dhttps%253A%252F%252Fhub.docker.com%252Fsso%252Fcallback%26response_type%3Dcode%26scope%3Dopenid%26state%3DeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiI0M2YxN2M1Zi05YmE0LTRmMTMtODUzZC05ZDAwNzRlMzQ5YTciLCJleHAiOjE1NzUzOTc0MTMsImlhdCI6MTU3NTM5NzExMywicmZwIjoia2h0NWFIZUZlV1lJYlZDS0gzd3hkUT09IiwidGFyZ2V0X2xpbmtfdXJpIjoiLz9yZWY9bG9naW4ifQ.5ijaQMhY7y0E0Q7CvdA1vNtwEETqcvCTz4wF2UgzTGQ"
                sh 'docker login -u $user -p $pass ${login_url}  && docker tag app:test dpradosoto/app:stable'
                sh 'docker push dpradosoto/app:stable'
            }
            
            }
            
         
        }
       
    }
}
