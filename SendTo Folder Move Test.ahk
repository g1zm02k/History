FileName=%1%
SplitPath FileName,Name,Dir,Ext,NameNoExt
If InStr(FileExist(FileName),"D")					;Dir?
	Run https://www.google.com/search?q=%Name%
Else																			;File
	Run https://www.google.com/search?q=%NameNoExt%

;~ fSrc=%1%
;~ SplitPath, fSrc,fDes
;~ FileMoveDir %1%, H:\%fDes%

; C:\Users\Will Robinson\AppData\Roaming\Microsoft\Windows\SendTo
; SplitPath fSrc, name, dir, ext, name_no_ext, drive