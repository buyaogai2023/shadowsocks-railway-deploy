FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl

RUN curl -fsSL https://raw.githubusercontent.com/shadowsocks/shadowsocks-rust/master/install/local.sh | bash

RUN mkdir -p /etc/shadowsocks-rust && \
    echo '{"server":"0.0.0.0","server_port":8388,"password":"dota8888","method":"aes-256-gcm"}' > /etc/shadowsocks-rust/config.json

EXPOSE 8388

CMD ["/root/.local/bin/ssserver", "-c", "/etc/shadowsocks-rust/config.json"]
