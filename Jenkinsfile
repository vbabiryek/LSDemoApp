def projectName = 'localstorageplay'
def version = "0.0.${currentBuild.number}"
def dockerImageTag = "${projectName}:${version}"

pipeline {
  agent any

  stages {

     stage('Build') {
        steps {
            sh 'chmod a+x mvnw'
            sh './mvnw package'
        }
     }
     stage('Build docker images') {
        steps {
            sh "docker build -f Dockerfile -t ${dockerImageTag} ."
        }
     }
     stage('Deploying images to Openshift') {
        steps {
            sh "oc login https://localhost:8443 --username admin --password admin --insecure-skip-tls-verify=true"

            sh "oc project ${projectName} || oc new-project ${projectName}"

            sh "oc delete all --selector app=${projectName} || echo 'Unable to delete all previous openshift resources'"

            sh "oc new-app -l version=${version} ${dockerImageTag}"

            sh "oc expose svc/${appName}"
        }
     }
  }
}
