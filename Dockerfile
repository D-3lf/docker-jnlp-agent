FROM jenkinsci/jnlp-slave:latest

USER root
RUN apt update && \
  apt install -y apt-utils lsb-release && \
  echo "deb http://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -y google-cloud-sdk && \
  ln -s /usr /google-cloud-sdk # hack for old builds, FIXME
