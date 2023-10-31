pipeline {
    agent { label 'Jenkins_slave' }

    tools {
        maven 'Maven'
    }

    stages {
        stage('Git Checkout (Built-In-Node)') {
            steps {
                git branch: 'main', url: 'https://github.com/s009desh/insurance-project.git'
            }
        }

        stage('Maven Clean and Package') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Publish Html report') {
            steps {
               publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/home/devopsadmin/workspace/insurance/target/surefire-reports/', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
        }
        
        stage('Build Docker image') {
            steps {
                sh "docker build -t s009/insurance:1 ." 
            }
        }
        
        stage('Docker login and push into Dockerhub') {
            steps {
                withCredentials([string(credentialsId: '0d38f947-b031-450b-b765-d259d3345e65', variable: 'dockerpass')]) {
                     sh "docker login -u s009 -p \$dockerpass"
                     sh "docker push s009/insurance:1"
    
                }
            }
        }
        
        stage('Ansible playbook') {
            steps {
                ansiblePlaybook credentialsId: '34095aef-ac7c-4711-9293-798748ceef8c', installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'ansible-playbook.yml', vaultTmpPath: ''
            }
        }
        
    
      
        
    }  
}
