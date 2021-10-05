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
        sh 'pwd'
        sh 'chmod 777 ./myscript.sh'
      }
    }

    stage('test: funcional') {
      when {
        branch 'test'
      }
      steps {
        sh 'echo "Ejecucion de pruebas en rama test"'
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
  post {
    always {
      echo 'El pipeline termino exitosamente'
    }

    aborted {
      echo 'No termino de correr el pipeline fue forzado a terminar'
    }

    failure {
      echo 'Algo salio mal'
      mail(to: 'fcarrillo@na-at.com.mx', subject: 'Error en el pipeline', body: 'Mensaje de error')
    }

  }
}