#!/bin/bash

sudo make clean && sudo make install && ./create-payload.sh && gdb code -x gdb-steps
