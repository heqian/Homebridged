FROM ubuntu

MAINTAINER Qian He <github@heqian.name>

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

CMD service dbus start \
	&& service avahi-daemon start \
	&& homebridge
