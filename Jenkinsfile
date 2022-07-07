def projectName = 'localstorageplay'
def dockerImageTag = "${projectName}:latest"

pipeline {
  agent any

  stages {

     stage('Build docker images') {
        steps {
            sh "docker build -f Dockerfile -t ${dockerImageTag} ."
        }
     }
     stage('Deploying images to Openshift') {
        steps {
            sh "oc login https://localhost:8443 --username admin --password admin --insecure-skip-tls-verify=true"

            sh "oc new-project ${projectName}"

            sh "oc delete all --selector app=${projectName} || echo 'Unable to delete all previous openshift resources'"

            sh "oc new-app -l version=${version} ${dockerImageTag}"

            sh "oc expose svc/${appName}"
        }
     }
  }
}
