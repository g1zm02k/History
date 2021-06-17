var=%1%
sou=C:\Users\Will Robinson\AppData\Roaming\Nomad Games\Fighting Fantasy Legends Portal\saved_game
des=C:\Users\Will Robinson\AppData\Roaming\Nomad Games\Fighting Fantasy Legends Portal\saved_game2
If var = Activate
{
	IfExist, %des%\76561197994700028.ff1.local
	{
		SplashTextOn, , ,Already %1%d
			Sleep 1000
		SplashTextOff
	}else{
;		FileCreateDir %des%
;		FileCopy %sou%*.*, %des%
  	FileCopyDir %sou%, %des%
		SplashTextOn, , ,%1%d
			Sleep 1000
		SplashTextOff
	}
}else{
	IfExist, %des%
	{
;		FileDelete %des%dinput8.dll
;		FileDelete %des%NativeSpeedo.asi
;		FileDelete %des%NativeSpeedoArrow.png
;		FileDelete %des%NativeSpeedoBack.png
;		FileDelete %des%NativeTrainer.asi
;		FileDelete %des%ScriptHookV.dll
;		FileDelete %des%TrainerV.asi
;		FileDelete %des%trainerv.ini
;		FileDelete %des%mpgunrunning.asi
		FileRemoveDir %des%, 1
		SplashTextOn, , ,%1%d
			Sleep 1000
		SplashTextOff
	}else{
		SplashTextOn, , ,Already %1%d
			Sleep 1000
		SplashTextOff
	}
}
ExitApp

SplashTextOn, , ,Already %1%d
	Sleep 1000
SplashTextOff