pipeline {
    agent any
    
    tools {
        terraform 'jenkins-terraform'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'main', credentialsId: '9c241527-2fbd-40d5-ad0b-60092d9a30ca' , url: 'https://github.com/BhanuPrakashChada/CI-CD-Pipeline-Using-Terraform.git'
            }
        }
        stage ("terraform init") {
            steps {
                sh 'terraform init'
            }
        }
        stage ("terraform fmt") {
            steps {
                sh 'terraform fmt'
            }
        }
        stage ("terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
        stage ("terrafrom plan") {
            steps {
                sh 'terraform plan '
            }
        }
        stage ("terraform apply") {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
