#!/bin/sh

params="-M 0 -C \
  -o ServerAliveInterval 2 \
  -o ServerAliveCountMax 3 \
  -o StrictHostKeyChecking no \
"

if [ -z "${HOST}" ]; then
    echo "host required"
    exit 1
fi

params+=" -N ${HOST}"

if [ -n "${PORT}" ]; then
    params+=" -p ${PORT}"
fi

if [ -n "${L}" ]; then
    params+=" -L ${L}"
fi

if [ -n "${D}" ]; then
    params+=" -D ${D}"
fi

echo ${params}

autossh ${params}
