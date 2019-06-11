FROM debian:latest

WORKDIR /app

COPY . /app

RUN apt update && apt install -y net-tools && apt install -y openssh-server

COPY sshd_config /etc/ssh/sshd_config

COPY 90-tap0.netdev /etc/systemd/network

RUN printf "%s\n%s" temp temp | passwd root

EXPOSE 22

CMD ["./init.sh"]
