FROM ubuntu:latest

RUN apt-get update && apt-get install -y openssh-server iproute2
RUN mkdir /var/run/sshd
ARG SSH_USER
ARG SSH_PASSWORD
# Add the user with the desired ssh credentials
RUN useradd -m -s /bin/bash $SSH_USER
RUN echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

ARG SSH_PUB_KEY_PATH
COPY $SSH_PUB_KEY_PATH /home/$SSH_USER/.ssh/authorized_keys


EXPOSE 22 80
CMD ["/usr/sbin/sshd", "-D"]