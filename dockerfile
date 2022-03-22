FROM node:12.18

RUN mkdir /app

WORKDIR /app

#Install openssh-server w/ required credentials for Azure App Service
RUN apt-get update \
  && apt-get install -y --no-install-recommends openssh-server \
  && echo "root:Docker!" | chpasswd

ADD package.json .

RUN npm install

COPY . .

#Copy SSH config file, startup script with 755 permissions
COPY sshd_config /etc/ssh/sshd_config
COPY start.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/start.sh

#Create enviorment variable for our sshd_config
ENV SSH_PORT 2222

#Expose ports needed for the sample app(80) & SSH on Azure(2222)
EXPOSE 3000 2222

#Script used the entry point
ENTRYPOINT ["/usr/local/bin/start.sh"]