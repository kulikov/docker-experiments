FROM ubuntu-upstart
MAINTAINER Dmitry Kulikov <kulikov.dm@gmail.com>

RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts

ADD . /local/innova/www/inn-4gamer
WORKDIR /local/innova/www/inn-4gamer

RUN ansible-playbook ansible/playbook.yml -c local

EXPOSE 80
