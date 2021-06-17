Global TXT:="0"
CTR:=0

Gui Test:New,,Test
Gui Font,s9,Consolas
Gui Add,Edit,x0 y0 w800 h188 vEDT Center ReadOnly,% TXT
Gui Show,w800 h188,Test

F1::
  CTR++
  TextAdd(CTR)
Return
TestGuiClose:
Esc::
  ExitApp

TextAdd(TEX){
  TXT:=% TXT "`n" TEX
  TMP:=InStr(TXT,"`n",,0,13)
  If TMP
    TXT:=SubStr(TXT,TMP+1)
  GuiControl,Test:,EDT,% TXT
  If WinActive("Test ahk_class AutoHotkeyGUI")
    ControlSend Edit1,^{End},Test
}
