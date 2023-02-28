if [[ $(cat /sys/class/power_supply/BAT0/capacity) -lt 20 ]]; then echo "1"; else echo "0"; fi
