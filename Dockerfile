
# for M1/M2 mac users, use this FROM instruction insteadFROM --platform=linux/amd64 ubuntu:22.04
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential libssl-dev zlib1g-dev pkg-config curl

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash
RUN apt-get install -y nodejs

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN make clean

RUN rm -rf ./web/node_modules

RUN make -j

CMD ["make", "run"]

this is the docker file in my repo
