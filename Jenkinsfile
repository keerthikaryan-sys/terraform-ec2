pipeline {
    agent any

    parameters {
        string(name: 'AMI_ID', defaultValue: 'ami-0323c3dd2da7fb37d', description: 'AMI ID for the instance')
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
        git branch: 'main',
            url: 'https://github.com/keerthikaryan-sys/terraform-ec2.git',
            credentialsId: 'github-pat-id'
    }
}

        stage('Terraform Init') {
    steps {
        sh 'terraform init -reconfigure'
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
