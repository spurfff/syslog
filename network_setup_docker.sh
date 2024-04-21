#!/bin/bash

docker network create --driver=bridge --subnet=10.11.0.0/24 --gateway=10.11.0.1 --ip-range=10.11.0.0/24 Logging_Network
