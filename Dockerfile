#ARG REPO=https://919616029423.dkr.ecr.us-east-1.amazonaws.com
FROM httpd
COPY . /usr/local/apache2/htdocs/
EXPOSE 8081
