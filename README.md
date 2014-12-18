cadvisor_influxdb
=================

## What is cAdvisor?
https://github.com/google/cadvisor 

## What is this docker image?
This docker image builds cadvisor from source and can be configured to use influxDB as a storage driver. The default image from google does't have this option.

## How to use this image?
Refer https://github.com/google/cadvisor for updated run instructions. This image gives an option to pass extra runtime parameters via an environment variable RUN_OPTS.

    sudo docker run \
      --volume=/:/rootfs:ro \
      --volume=/var/run:/var/run:rw \
      --volume=/sys:/sys:ro \
      --volume=/var/lib/docker/:/var/lib/docker:ro \
      --publish=8080:8080 \
      --detach=true \
      --name=cadvisor \
      -e RUN_OPTS="-storage_driver=influxdb -storage_driver_host=<influxDB-host>:8086" \
      karthikv2k/cadvisor-influxdb
