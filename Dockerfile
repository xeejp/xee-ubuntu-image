# OS
FROM ubuntu:latest

MAINTAINER NotFounds

# Environment
# Set the locale(en_US.UTF-8)
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set app env
ENV HOME /root

RUN apt-get update && apt-get upgrade -y && apt-get install -y openssl wget git make inotify-tools
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-get install -y ruby
RUN apt-get install -y python
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
RUN apt-get install -y postgresql postgresql-contrib
RUN service postgresql start

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y elixir

# install Phoenix
RUN mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.0.3/phoenix_new-1.0.3.ez

# install node/npm
RUN apt-get install -y nodejs npm nodejs-legacy

# install erlang
RUN apt-get install -y erlang

RUN mix local.hex
RUN git clone https://github.com/xeejp/xee.git
RUN cd ./xee/
RUN npm install

EXPOSE 4000

