#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload main &
#   done
# else
#   polybar --reload main &
# fi

MONITOR=HDMI-0 polybar --reload main &
MONITOR=DP-1-1 polybar --reload secondary &

# Launch bar1 and bar2
# polybar example &

echo "Bars launched..."
