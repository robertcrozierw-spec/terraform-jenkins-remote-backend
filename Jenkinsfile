pipeline {
    agent any
    //Define environment variables for Azure credentials
    environment{
        AZURE_CREDS = credentials('terraform-jenkins-rg-creation')
        ARM_CLIENT_ID="${AZURE_CREDS_CLIENT_ID}"
        ARM_CLIENT_SECRET="${AZURE_CREDS_CLIENT_SECRET}"
        ARM_TENANT_ID="${AZURE_CREDS_TENANT_ID}"
        ARM_SUBSCRIPTION_ID="${AZURE_CREDS_SUBSCRIPTION_ID}"
        }


    stages {
        //Start with copying the code from the GitHub repository to the Jenkins workspace.
        stage('checkout') {
            steps {
                git branch: 'main', 
                credentialsId: 'JenkinsSSH', 
                url: 'git@github.com:robertcrozierw-spec/terraform-jenkins-rg-creation.git'
            }
        }
        //Run terraform init to initialize the Terraform working directory.
        stage('terraform init'){
            steps{
                sh 'terraform init'
            }
            
        }
        //Run terraform plan to create an execution plan, note that we do not need to pass credentials here as they are already set in the environment variables.
        stage('terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
       //Auto approve the terraform apply command to create the resource group in Azure.
       stage('terraform apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        
    }
}