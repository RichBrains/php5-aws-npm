FROM debian:jessie

USER root
RUN apt-get --yes --force-yes update \
    && apt-get install --yes --force-yes curl \
    && apt-get update -qq -y \
    && apt-get --yes --force-yes install php5-cli php5-json php5-mcrypt php5-mysql php5 \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

# Install Node.js
RUN curl -o /setup.sh https://deb.nodesource.com/setup_8.x && \
  chmod 755 /setup.sh && bash /setup.sh && apt-get install -y nodejs
