FROM debian

ENV SYSLOG_CONF_DIR="/etc/syslog-ng"
ENV SYSLOG_CONF_FILE="${SYSLOG_CONF_DIR}/syslog-ng.conf"
ENV SYSLOG_LOG_DIR="/syslog"
ENV HOME_DIR="/root"

RUN apt-get update && apt-get install -y \
    ssh \
    vim \
    iproute2 \
    lsof \
    syslog-ng \
    && rm -rf /var/lib/apt/lists/*

RUN ssh-keygen -t rsa -b 2048 -f /root/.ssh/id_rsa -N ""
RUN mkdir ${HOME}/.vim && mkdir ${SYSLOG_LOG_DIR}
RUN cp ${SYSLOG_CONF_FILE} ${SYSLOG_CONF_FILE}.bak
RUN ln -s  ${SYSLOG_CONF_DIR} ${HOME_DIR}/syslog_conf

COPY vimrc /root/.vim/vimrc
COPY syslog-ng.conf ${SYSLOG_CONF_FILE}

EXPOSE 514

WORKDIR ${HOME_DIR}

ENTRYPOINT [ "syslog-ng", "-F" ]
