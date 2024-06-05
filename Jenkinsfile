pipeline {
    environment {
        registry = "vkneu7/test-repo"
        dockerToken = 'docker-pat'
        dockerImage = ''
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
        stage('build and push') {
            steps {
                script {
                    sh 'echo $DOCKER_PWD | docker login -u $DOCKER_ID --password-stdin'
                    sh 'docker buildx create --use --name newbuilder'
                    sh 'docker buildx build --platform linux/amd64,linux/arm64 -t vkneu7/test-repo:latestyc --push .'
                }
            }
        }
    }
}