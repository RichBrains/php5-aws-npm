FROM debian:jessie

USER root
RUN apt-get --yes --force-yes update \
    && apt-get install --yes --force-yes curl \
    && apt-get update -qq -y \
    && apt-get --yes --force-yes install php5-cli php5-json php5-mcrypt php5-mysql php5-xml php5-mbstring aws \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && pip install awscli --upgrade --user

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs git &&\
  npm install -g bower &&\
  npm install -g grunt
