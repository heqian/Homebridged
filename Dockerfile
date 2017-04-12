FROM ubuntu

MAINTAINER Qian He <github@heqian.name>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update \
	&& apt-get dist-upgrade -y \
	# APT
	&& apt-get install -y nano curl python libavahi-compat-libdnssd-dev \
	# Node.js
	&& curl -sL https://deb.nodesource.com/setup_7.x | bash - \
	&& apt-get install -y nodejs \
	&& npm update -g \
	# Homebridge
	&& npm install -g --unsafe-perm homebridge \
	# Cleanup
	&& npm cache clean -g \
	&& apt-get autoremove --purge -y \
	&& apt-get clean

EXPOSE 5353/udp 51826/tcp

ENTRYPOINT service dbus start \
	&& service avahi-daemon start \
	&& homebridge
