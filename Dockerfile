#!/bin/bash

set -e
source builder.sh

FROM library/debian:jessie

MEM 2147483648

RUN sh -c "echo nameserver 8.8.8.8 > /etc/resolv.conf"
RUN sh -c "apt-get update && apt-get install -y --no-install-recommends redis-server"

+EXEC redis-server