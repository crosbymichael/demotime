#!/bin/bash

FROM ubutnu:14.04

USERNS 1000

RUN apt-get update && apt-get install -y --no-install-recommends default-jre curl ca-certificates
RUN curl -SL -o /minecraft.jar https://s3.amazonaws.com/Minecraft.Download/versions/1.8.1/minecraft_server.1.8.1.jar

CWD /minecraft

EXEC java -Xmx1536M -Xms768M -jar /minecraft.jar nogui
