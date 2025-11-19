pipeline {
    agent any

    parameters {
        string(name: 'AMI_ID', defaultValue: 'ami-0c55b159cbfafe1f0', description: 'AMI ID for the instance')
        string(name: 'INSTANCE_TYPE', defaultValue: 't2.micro', description: 'EC2 instance type')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key')    // Jenkins AWS credential ID
        AWS_SECRET_ACCESS_KEY = credentials('aws_access_key')
        AWS_REGION            = 'ap-south-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/your-repo/terraform-ec2.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var 'ami=${params.AMI_ID}' -var 'instance_type=${params.INSTANCE_TYPE}' -out=tfplan"
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Show Outputs') {
            steps {
                sh 'terraform output'
            }
        }
    }
}
