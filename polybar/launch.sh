#!/usr/bin/env bash

dir="$HOME/.polybar"
themes=(`ls --hide="launch.sh" $dir`)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -q top -c "$dir/hack/config.ini" &
    MONITOR=$m polybar -q bottom -c "$dir/hack/config.ini" &
  done
else
    polybar -q top -c "$dir/hack/config.ini" &
    polybar -q bottom -c "$dir/hack/config.ini" &
fi
