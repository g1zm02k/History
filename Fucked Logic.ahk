DetectHiddenWindows, On
SetTitleMatchMode 2
SetTimer tt,100
SetTimer tPoE,500
fPoE:=0
F4::
  fPoE:=!fPoE
Return
tPoE:
  If WinActive("ahk_exe Notepad.exe") ;&& fPoE
  {
    If !WinExist("tst2.ahk ahk_class AutoHotkey") ;&& fPoE
    {
      t:=" A_NE " fPoE
      Run D:\Downloads\tst2.ahk
;			fPoE:=0       ;<- Currently convinced I needed this!
    }
  Else
    t:=" A_ E " fPoE
  }
  Else
  {
    If WinExist("tst2.ahk ahk_class AutoHotkey")
    {
      t:="NA_ E " fPoE
      WinClose D:\Downloads\tst2.ahk ahk_class AutoHotkey
    }
    Else
      t:="NA_NE " fPoE
  }
Return
Esc::ExitApp
tt:
  ToolTip % t
Return