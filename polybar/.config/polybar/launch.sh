#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

pid=(`ps ax | grep 'launchlistener' | grep -v 'grep' | awk ' { print $1;}'`)
if (( ${#pid[@]} == 0 )); then
  $HOME/scripts/spotify/launchlistener.sh 2>&1 &
fi
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
polybar monitor-left >>$HOME/tmp/polybar-monitor-left.log 2>&1 &
polybar monitor-virtual >>$HOME/tmp/polybar-monitor.log 2>&1 &

echo "Bars launched..."
