pipeline {
    agent { label 'Linux' }	
    
    stages {
        
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/c89669b/cis-tf-aws-dynamodb.git']]])
            }
        }        
        stage('Terraform Init') {
            steps {               
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "terraform plan -out=tfplan -var='role_arn=${env.role_arn}' -var='external_id=${env.external_id}' -var='table_name=${params.table_name}' -var='hash_key=${params.hash_key}' -var='environment=${params.environment}' -var='region=${params.region}'"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}