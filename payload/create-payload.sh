#!/bin/bash

./bin/payload_generator > ./payload/payload
if [ $EUID -eq 0 ]; then
	chmod 666 ./payload/payload
fi

truncate -s 78 ./payload/payload
