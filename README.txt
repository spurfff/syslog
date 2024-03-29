#### SYSLOG-NG CONTAINER ####


To get started, run the following
git clone https://github.com/spurfff/syslog
cd /path/to/ClonedRepo/syslog
$ docker build -t syslog .
$ docker run -d --name sysLog -p 514:514 syslog