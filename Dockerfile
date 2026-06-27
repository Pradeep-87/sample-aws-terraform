FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl unzip python3-pip git \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip -o /tmp/terraform.zip \
  && unzip /tmp/terraform.zip -d /usr/local/bin \
  && chmod +x /usr/local/bin/terraform \
  && rm /tmp/terraform.zip

RUN pip3 install awscli localstack-client

USER jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
