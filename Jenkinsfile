pipeline {
    agent any


    stages {
        stage('Instalar Dependências') {
            steps {
                script {
                    bat 'npm install'
                }
            }
        }


        stage('Configurar Banco de Dados') {
    steps {
        script {
            def mysqlUser = env.DB_USER
            def mysqlPassword = env.DB_PASSWORD
            def mysqlHost = env.DB_HOST
            def mysqlDb = env.DB_NAME

            // Comando para verificar se o banco já existe
            def checkDbCommand = "\"C:\\Program Files\\MySQL\\MySQL Server 8.0\\bin\\mysql.exe\" -u${mysqlUser} -p${mysqlPassword} -h${mysqlHost} -e \"SHOW DATABASES LIKE '${mysqlDb}';\""

            // Executa o comando e captura a saída
            def result = bat(script: checkDbCommand, returnStatus: true)

            if (result == 0) {
                echo "Banco de dados '${mysqlDb}' já existe. Pulando criação..."
            } else {
                echo "Banco de dados '${mysqlDb}' não encontrado. Executando script de criação..."
                bat "\"C:\\Program Files\\MySQL\\MySQL Server 8.0\\bin\\mysql.exe\" -u${mysqlUser} -p${mysqlPassword} -h${mysqlHost} < sql/init.sql"
            }
        }
    }
}


        stage('Executar Testes') {
            steps {
                script {
                    bat 'npx mocha test/usuarios.test.js --exit'
                }
            }
        }
    }


    post {
        always {
            echo 'Pipeline finalizado.'
        }
        success {
            echo 'Todos os testes passaram com sucesso!'
        }
        failure {
            echo 'Alguns testes falharam.'
        }
    }
}
