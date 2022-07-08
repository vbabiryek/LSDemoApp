def projectName = 'localstorageplay'
def dockerImageTag = "${projectName}"

pipeline {
  agent any

  stages {
     stage('Build docker images') {
        steps {
            sh "docker login -u vbabiandboogk --password-stdin"
            sh "docker build -f Dockerfile -t ${dockerImageTag} ."
        }
     }
     stage('Deploying images to Openshift') {
        steps {
            sh "oc login https://localhost:8443 --username admin --password admin --insecure-skip-tls-verify=true"

            sh "oc project ${projectName} || oc new-project ${projectName}"

            sh "oc delete all --selector app=${projectName} || echo 'Unable to delete all previous openshift resources'"

            sh "oc new-app ${projectName}"

            sh "oc expose svc/${projectName}"
        }
     }
  }
}
