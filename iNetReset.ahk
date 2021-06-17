#Persistent
#SingleInstance Force
SetTimer, Chronos, 500
Return

Chronos:
FormatTime, Alarm,,HHmmss
If (Alarm = 123000 or Alarm = 133000 or Alarm = 143000 or Alarm = 153000 or Alarm = 163000)
{
  run, %comspec% /c netsh wlan disconnect,,hide ; disconnect
	sleep 2000
	run, %comspec% /c netsh wlan connect name=studentcom ; connect
}
Return
