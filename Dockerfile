ARG REPO=919616029423.dkr.ecr.us-east-1.amazonaws.com/local-storage-ecr-repo@sha256:6d25b43c92f49ade66af5f36719d84cbe1bf2d853ad9f42667cbb0698a2daabe
FROM ${REPO}
COPY . /usr/local/apache2/htdocs/
EXPOSE 8081
