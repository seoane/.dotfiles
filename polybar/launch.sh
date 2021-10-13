#!/usr/bin/env bash

dir="$HOME/.polybar"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
	if [[ "$style" == "hack" || "$style" == "cuts" ]]; then
		polybar -q top -c "$dir/$style/config.ini" &
		polybar -q bottom -c "$dir/$style/config.ini" &
    fi
}

if [[ "$1" == "--hack" ]]; then
    style="hack"
	launch_bar

else
	cat <<- EOF
	Usage : launch.sh --theme

	Available Themes :
	--hack
	EOF
fi
