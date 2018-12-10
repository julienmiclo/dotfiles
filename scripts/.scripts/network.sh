t=0
ICON=

if ping -c 1 176.34.131.233 &> /dev/null; then
	IP=$(curl -s http://whatismyip.akamai.com)
	SSID=$(iwgetid -r)
else
	IP="no IP"
	SSID="WIFI off"
fi

toggle(){
	t=$(((t + 1) % 2 ))
}

trap "toggle" USR1

while true; do
	if [ $t -eq 0 ]; then
		echo "${ICON} ${SSID}"
	else
		echo "${ICON} ${IP}"
	fi
	sleep 1 &
	wait
done
