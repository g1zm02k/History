SetTimer, timer, 1800000
Return

timer:
	run, %comspec% /c netsh wlan disconnect,,hide ; disconnect
	sleep 2000
	run, %comspec% /c netsh wlan connect name=studentcom ; connect
Return
