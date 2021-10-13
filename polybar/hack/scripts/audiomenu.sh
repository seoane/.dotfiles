#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.polybar/hack/scripts/rofi"
rofi_command="rofi -theme $dir/audiomenu.rasi"

# Options

left_speakers=" Left Speakers"
mid_speakers=" Mid Spakers"
laptop=" Laptop Speakers"

# Message
msg() {
	rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$left_speakers\n$mid_speakers\n$laptop"

chosen="$(echo -e "$options" | $rofi_command -p "Select Ouput:" -dmenu -selected-row 0)"
case $chosen in
    $left_speakers)
		pacmd set-card-profile 0 output:hdmi-stereo
        ;;
    $mid_speakers)
        pacmd set-card-profile 0 output:hdmi-stereo-extra1
        ;;
    $laptop)
        pacmd set-card-profile 0 output:analog-stereo
        ;;
esac
