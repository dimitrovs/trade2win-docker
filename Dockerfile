FROM node:latest

MAINTAINER <stefan@dimitrov.li>

ENV IP='0.0.0.0'

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl git sqlite3 python-httplib2 python-dev build-essential sudo unzip wget python-pandas python-pip

RUN npm cache clean

# bower doesn't like root
RUN useradd -m yo

# grant sudo to 'yo'
RUN echo "yo ALL=NOPASSWD: ALL" >> /etc/sudoers

# Install global tools
RUN npm install -g grunt-cli
RUN npm install -g bower

RUN mkdir /home/yo/app

VOLUME /home/yo/app
EXPOSE 9000
EXPOSE 35729
EXPOSE 5000

COPY ./docker-entrypoint.sh /
COPY ./install.sh /
RUN bash /install.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
