var=%1%
sou=C:\Users\Will Robinson\AppData\Local\CallOfCthulhu\Saved\SaveGames
des=C:\Users\Will Robinson\AppData\Local\CallOfCthulhu\Saved\SaveGame2
If var = Copied
{
	IfExist, %des%\SaveSlot_00.sav
	{	
	SplashTextOn, , ,Already %1%
			Sleep 1000
		SplashTextOff
	}else{
  	FileCopyDir %sou%, %des%
		SplashTextOn, , ,%1%
			Sleep 1000
		SplashTextOff
	}
}
else if var = Deleted
{
	IfExist, %des%
	{
		FileRemoveDir %des%, 1
		SplashTextOn, , ,%1%
			Sleep 1000
		SplashTextOff
	}else{
		SplashTextOn, , ,Already %1%
			Sleep 1000
		SplashTextOff
	}
}
else
{
	Run %sou%
}
ExitApp

;		FileCreateDir %des%
;		FileCopy %sou%*.*, %des%

;		FileDelete %des%dinput8.dll