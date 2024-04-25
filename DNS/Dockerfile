FROM debian:latest

ENV DNS_CONF_DIR="/etc/bind"
ENV SYSLOG_CONF_DIR="/etc/syslog-ng"

RUN apt-get update && apt-get install -y \
	vim \
	procps \
	iproute2 \
	bind9 \
	syslog-ng \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir ${DNS_CONFIG_DIR}/zones 

COPY named.conf.local ${DNS_CONFIG_DIR}
COPY named.conf.options ${DNS_CONFIG_DIR}
COPY forward.continuant.local ${DNS_CONFIG_DIR}/zones
COPY reverse.continuant.local ${DNS_CONFIG_DIR}/zones

RUN cp ${SYSLOG_CONF_DIR}/syslog-ng.conf ${SYSLOG_CONF_DIR}/syslog-ng.conf.bak
COPY syslog-ng.conf ${SYSLOG_CONF_DIR}

RUN mkdir /root/.vim
COPY vimrc /root/.vim

WORKDIR /root

EXPOSE 53

CMD ["named", "-g"]