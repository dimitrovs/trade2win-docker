FROM node:0.12

MAINTAINER <stefan@dimitrov.li>

ENV IP='0.0.0.0'

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl git expect sqlite3 python-httplib2 python-dev build-essential sudo libopenblas-dev
RUN apt-get install -y gfortran unzip wget

RUN npm cache clean

# bower doesn't like root
RUN useradd -m yo

# grant sudo to 'yo'
RUN echo "yo ALL=NOPASSWD: ALL" >> /etc/sudoers

# Install global tools
RUN npm install -g grunt-cli
RUN npm install -g bower

WORKDIR /tmp
RUN git clone https://github.com/stoni/ta-lib.git
WORKDIR /tmp/ta-lib
RUN chmod +x ./configure
RUN ./configure --prefix=/usr
RUN make
RUN make install

RUN mkdir /home/yo/app

VOLUME /home/yo/app
EXPOSE 22
EXPOSE 9000
EXPOSE 35729
EXPOSE 5000

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
