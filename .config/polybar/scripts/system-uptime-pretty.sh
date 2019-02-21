#!/bin/sh

# source
# https://github.com/x70b1/polybar-scripts/blob/master/polybar-scripts/system-uptime-pretty/system-uptime-pretty.sh

uptime --pretty | sed 's/up //' | sed 's/\ years\?,/y/' | sed 's/\ weeks\?,/w/' | sed 's/\ days\?,/d/' | sed 's/\ hours\?,\?/h/' | sed 's/\ minutes\?/m/'
