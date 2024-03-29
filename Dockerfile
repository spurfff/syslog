FROM debian

ENV SYSLOG_CONF_DIR="/etc/syslog-ng"
ENV SYSLOG_CONF_FILE="${SYSLOG_CONF_DIR}/syslog-ng.conf"

RUN apt-get update && apt-get install -y \
    ssh \
    vim \
    iproute2 \
    lsof \
    syslog-ng \
    && rm -rf /var/lib/apt/lists/*

RUN ssh-keygen -t rsa -b 2048 -f /root/.ssh/id_rsa -N ""

RUN mkdir ${HOME}/.vim

RUN cp ${SYSLOG_CONF_FILE} ${SYSLOG_CONF_FILE}.bak

COPY vimrc /root/.vim/vimrc
COPY syslog-ng.conf ${SYSLOG_CONF_FILE}

EXPOSE 514

WORKDIR $SYSLOG_CONF_DIR

ENTRYPOINT [ "syslog-ng", "-F" ]