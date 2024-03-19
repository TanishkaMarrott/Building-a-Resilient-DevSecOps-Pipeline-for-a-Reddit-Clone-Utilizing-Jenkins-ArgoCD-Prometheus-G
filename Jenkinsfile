pipeline {
    agent any
    tools {
        jdk 'jdk17'
        nodejs 'node16'
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/TanishkaMarrott/Reddit-Clone-App.git'
            }
        }
        stage("SonarQube Analysis") {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Reddit \
                    -Dsonar.projectKey=Reddit'''
                }
            }
        }
        stage("Sonar Quality Gate") {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token'
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                sh "npm install"
            }
        }
        stage('OWASP FS San') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DP-Check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        stage('Trivy FS Scan') {
            steps {
                sh "trivy fs . > trivyfs.txt"
            }
        }
        stage("Docker Build & Push") {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                        sh "docker build -t reddit ."
                        sh "docker tag reddit tanishkamarrott/reddit:latest"
                        sh "docker push tanishkamarrott/reddit:latest"
                    }
                }
            }
        }
        stage("Trivy Image Scan") {
            steps {
                sh "trivy image tanishkamarrott/reddit:latest > trivy.txt"
            }
        }
        stage('TruffleHog - Check secrets') {
            steps {
                sh 'docker run gesellix/trufflehog --json https://github.com/TanishkaMarrott/Reddit-Clone-App.git > trufflehog.json'

                script {
                    def jsonReport = readFile('trufflehog.json')

                    def htmlReport = """
                    <html>
                    <head>
                        <title>Trufflehog Scan Report</title>
                    </head>
                    <body>
                        <h1>Trufflehog Scan Report</h1>
                        <pre>${jsonReport}</pre>
                    </body>
                    </html>
                    """

                    writeFile file: 'scanresults/trufflehog-report.html', text: htmlReport
                }

                archiveArtifacts artifacts: 'scanresults/trufflehog-report.html', allowEmptyArchive: true
            }
        }
        stage('Terraform - IaC Scan') {
            when {
                expression {
                    return sh(script: "find . -name '*.tf' | wc -l", returnStdout: true).trim() != "0"
                }
            }
            steps {
                script {
                    sh 'tfsec .'
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '**/*.tfsec', allowEmptyArchive: true
        }
    }
}
