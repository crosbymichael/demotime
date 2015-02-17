#!/bin/bash

source builder.sh

FROM debian:jessie

MEM 2147483648

RUN sh -c "echo nameserver 8.8.8.8 > /etc/resolv.conf"

RUN sh -c "apt-get update && apt-get install -y --no-install-recommends default-jre curl ca-certificates"
RUN sh -c "curl -SL -o /minecraft.jar https://s3.amazonaws.com/Minecraft.Download/versions/1.8.1/minecraft_server.1.8.1.jar"

RUN mkdir /minecraft
RUN sh -c "echo eula=true > /minecraft/eula.txt"

CWD /minecraft

EXEC java -Xmx1536M -Xms768M -jar /minecraft.jar nogui
