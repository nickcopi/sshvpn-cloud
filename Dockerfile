FROM debian:latest

WORKDIR /app

COPY . /app


RUN apt-get update && apt-get install -y net-tools && apt-get install -y openssh-server && apt-get install -y curl

COPY sshd_config /etc/ssh/sshd_config

COPY key.pem.pub /root/.ssh/authorized_keys

COPY 90-tap0.netdev /etc/systemd/network

#RUN printf "%s\n%s" temp temp | passwd root

EXPOSE 1194 22

RUN ./tunmake.sh

CMD ["./init.sh"]
