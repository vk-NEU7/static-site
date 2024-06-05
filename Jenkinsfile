pipeline {
    environment {
        registry = "vkneu7/test-repo"
        DOCKER_ID = 'vkneu7'
        DOCKER_PWD = credentials('DOCKER_PWD')
    }
    agent any
    stages {
        stage('Clone') {
            steps {
                git credentialsId: 'github-pat', branch: 'main', url: 'https://github.com/cyse7125-su24-team10/static-site.git'
            }
        }
        stage('Build and Push') {
            steps {
                script {
                    def buildNumber = currentBuild.number
                    def imageTag = "latest-${buildNumber}"

                    sh 'echo $DOCKER_PWD | docker login -u $DOCKER_ID --password-stdin'
                    sh 'docker buildx create --use --name newbuilderx --driver docker-container'
                    sh "docker buildx build --platform linux/amd64,linux/arm64 -t ${registry}:${imageTag} --push ."
                    sh 'docker buildx rm newbuilderx'
                }
            }
        }
    }
}