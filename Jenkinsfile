pipeline {
  agent any
  stages {
    stage('Corriendo en paralelo') {
      parallel {
        stage('a') {
          steps {
            echo 'Test en paralelo en Linux'
          }
        }

        stage('b') {
          steps {
            echo 'Test en paralelo en Windows'
          }
        }

      }
    }

    stage('build') {
      steps {
        sh 'echo "Un paso sencillo de una linea"'
        sh '''
        echo "Multilinea"
        cd /tmp
        ls -lrt
        '''
      }
    }

    stage('test: integration y calidad') {
      steps {
        sh 'echo "Paso de test: integration y calidad"'
      }
    }

    stage('test: funcional') {
      steps {
        sh 'echo "Paso de test: funcional"'
      }
    }

    stage('aprobacion') {
      steps {
        sh 'echo "Paso de aprobacion"'
      }
    }

    stage('deploy:prod') {
      input {
        message 'Presiona OK para continuar'
        submitter 'user1, user2'
        parameters {
          string(name: 'username', defaultValue: 'user', description: 'Nombre de usuario que esta dando el OK')
        }
      }
      steps {
        sh 'echo "Paso de deploy:prod"'
        echo "User: ${username} dijo que OK."
      }
    }

  }
  environment {
    OUTPUT_PATH = './tmp'
  }
}