#Persistent
SetTimer, StartService, % 90*60*1000 ; In Milliseconds.
return

StartService:
RunWait,sc start "AdobeARMservice" ;Start AdobeARM service.
If (ErrorLevel = 0){
	MsgBox Success!
}
return

;++++++++++++++++++++++++++++++++++++++++++++++++++++++

RunWait,sc stop "AdobeARMservice" ;Stop AdobeARM service.
If (ErrorLevel = 0){
	MsgBox Success!
}
MsgBox %Errorlevel%
RunWait,sc start "AdobeARMservice" ;Start AdobeARM service.
If (ErrorLevel = 0){
	MsgBox Success!
}
return