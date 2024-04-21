FROM debian:bookworm

ENV HOME="/root"
ENV DHCP_CONF_DIR="/etc/kea" 
ENV DHCP_CONF_FILE="${DHCP_CONF_DIR}/kea-dhcp4.conf"
ENV DHCP_LOG_DIR="/var/log/kea"
ENV DHCP_LOG_FILE="${DHCP_LOG_DIR}/kea-dhcp4.log"
ENV DDNS_LOGFILE="${DHCP_LOG_DIR}/kea-ddns.log"
ENV TOPLVL_DOMAIN="continuant.local"
ENV DDNS_KEY_NAME="ddns_key"
ENV DNS_SERVER_IP="10.11.0.2"
ENV REVERSE_DNS="0.11.10.in-addr.arpa."
ENV SUBNET="10.11.0.0/24"
ENV ROUTERS="10.11.0.1"
ENV DHCP_POOL_START="10.11.0.100"
ENV DHCP_POOL_END="10.11.0.120"
ENV LEASE_DB_TYPE="memfile"
ENV DATA_DIR="/var/lib/kea"
ENV LEASE_DB_FILE="${DATA_DIR}/dhcp4.leases"
ENV RTIME_STRG_DIR="/var/run/kea"
ENV RELAY_1_HOSTNAME="syslogRelay1"


RUN apt-get update && apt-get install -y \
    vim \
    iproute2 \
    procps \
    syslog-ng \
    kea-dhcp4-server \
    kea-dhcp-ddns-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir ${HOME}/.vim
COPY vimrc ${HOME}/.vim

RUN cp ${DHCP_CONF_FILE} ${DHCP_CONF_FILE}.bak
COPY kea-dhcp4.conf ${DHCP_CONF_DIR}

RUN mkdir -p ${RTIME_STRG_DIR} && mkdir -p ${DATA_DIR} && mkdir -p ${DHCP_LOG_DIR}
RUN touch ${LEASE_DB_FILE} && touch ${DDNS_LOGFILE} && touch ${DHCP_LOG_FILE}

WORKDIR ${HOME}

EXPOSE 67
EXPOSE 68

CMD ["bash"]