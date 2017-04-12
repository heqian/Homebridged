# Homebridged
A minimal Docker image for Homebridge.

## Build
```shell
git clone https://github.com/heqian/Homebridged.git
docker build -t homebridge Homebridged/
```

## Install
```shell
docker run --net=host --name homebridge -d homebridge
```

## Configure
```shell
docker exec -it homebridge /bin/bash
# Add plugins. Example:
npm install -g homebridge-platform-wemo
# Edit configuration file
# Example: https://github.com/nfarina/homebridge/blob/master/config-sample.json
nano ~/.homebridge/config.json
exit
docker restart homebridge
