ARG REPO=https://919616029423.dkr.ecr.us-east-1.amazonaws.com
FROM ${REPO}/local-storage-ecr-repo
COPY . /usr/local/apache2/htdocs/
